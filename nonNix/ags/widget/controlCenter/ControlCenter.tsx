import { App, Astal, Gdk } from "astal/gtk3"
import { PowerLine } from "./PowerLine"
import { Connectivity } from "./Connectivity"
import { QuickButtons } from "./QuickButtons"
import { PowerProfiles } from "./PowerProfiles"
import { Sliders } from "./Sliders/Sliders"
import { Media } from "./Media/Media"
import { DoNotDisturb } from "./DoNotDisturb"
import { Variable } from "astal"
import { WiFi } from "./WifiView"
import { Bluetooth } from "./BluetoothView"
import AstalNetwork from "gi://AstalNetwork"
import AstalBluetooth from "gi://AstalBluetooth"
import { Apps } from "./Apps/Apps"
import { Mixer } from "./Mixer/Mixer"
import { SidePanel } from "./SidePanel"
import { View } from "../../types"

type ControlProps = { setCurrentView: (view: View) => void }

const Controls = ({ setCurrentView }: ControlProps) => {
    const network = AstalNetwork.get_default()
    const bluetooth = AstalBluetooth.get_default()

    return (
        <>
            <box spacing={8} className="equal-wrapper">
                <Connectivity
                    onWifiPrimary={() => setCurrentView("wifi")}
                    onWifiSecondary={() => network.wifi.enabled = !network.wifi.enabled}
                    onBluetoothPrimary={() => setCurrentView("bluetooth")}
                    onBluetoothSecondary={() => bluetooth.toggle()} />
                <QuickButtons />
            </box>
            <box spacing={8} className="equal-wrapper">
                <PowerProfiles />
                <DoNotDisturb />
            </box>
            <Sliders />
            <Media />
            <PowerLine />
        </>
    )
}

export const ControlCenter = () => {
    const { TOP, LEFT } = Astal.WindowAnchor

    const currentView = Variable<View>("controls");
    const reset = () => currentView.set("controls")
    const resetAndClose = () => {
        reset()
        App.toggle_window("control-center")
    }

    return (
        <window
            name="control-center"
            className="control-center"
            exclusivity={Astal.Exclusivity.NORMAL}
            anchor={TOP | LEFT}
            application={App}
            margin-top={8}
            margin-left={8}
            setup={self => App.add_window(self)}
            visible={false}
            keymode={Astal.Keymode.EXCLUSIVE}
            onKeyPressEvent={(self, event: Gdk.Event) => {
                if (event.get_keyval()[1] === Gdk.KEY_Escape) {
                    self.hide()
                }
            }}
        >
            <box>
                <SidePanel currentView={currentView} />
                <box vertical spacing={8} className="control-center-wrapper">
                    {currentView((view) => {
                        switch (view) {
                            case "controls":
                                return <controls setCurrentView={(view) => currentView.set(view)} />
                            case "wifi":
                                return <WiFi reset={reset} />
                            case "bluetooth":
                                return <Bluetooth reset={reset} />
                            case "apps":
                                return <Apps reset={resetAndClose} />
                            case "mixer":
                                return <Mixer reset={resetAndClose} />
                        }
                    })}
                </box>
            </box>
        </window>
    )
}
