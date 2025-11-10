// 
//                           SimuLTE
// 
// This file is part of a software released under the license included in file
// "license.pdf". This license can be also found at http://www.ltesimulator.com/
// The above file and the present reference are part of the software itself, 
// and cannot be removed from it.
//
package Mutil_Cell;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.node.inet.AdhocHost;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import inet.node.ethernet.Eth10G;

import org.car2x.veins.visualizer.roads.RoadsCanvasVisualizer;
import simu5g.world.radio.LteChannelControl;
import simu5g.common.carrierAggregation.CarrierAggregation;
import simu5g.nodes.PgwStandard;
import simu5g.common.binder.Binder;
import simu5g.nodes.eNodeB;
import simu5g.nodes.Ue;
import simu5g.nodes.cars.Car;
import simu5g.nodes.cars.Car2;
import simu5g.nodes.cars.Car3;


import org.car2x.veins.subprojects.veins_inet.VeinsInetManager;
network Mixed_Traffic_Flow_Scenario
{
    parameters:
        double playgroundSizeX @unit(m); // x size of the area the nodes are in (in meters)
        double playgroundSizeY @unit(m); // y size of the area the nodes are in (in meters)
        double playgroundSizeZ @unit(m); // z size of the area the nodes are in (in meters)
        @display("bgb=7639.5996,6148.5996;bgu=m");//8682,8733

    submodules:
        routingRecorder: RoutingTableRecorder {
            @display("p=6674,4416.1997;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=6674,2996.2;is=s");
        }
        carrierAggregation: CarrierAggregation {
            @display("p=6674,3706.2;is=s");
        }

        //# Veins manager module
        veinsManager: VeinsInetManager {
            @display("p=6674,880.39996;is=s");
        }

        //# LTE modules
        channelControl: LteChannelControl {
            @display("p=6659.8,156.2;is=s");
        }
        binder: Binder {
            @display("p=6674,2300.4;is=s");
        }
        human_driven_car[0]: Car {
            @display("p=3379.5999,2414;is=vs");
        }
        autonomous_car[0]: Car2 {
            @display("p=2201,1576.2;is=vs");
        }
        assist_car[0]: Car3 {
            @display("p=1221.2,2825.7998;is=vs");
        }

        eNodeB1: eNodeB {
            @display("p=1235.3999,1363.2");
        }
        eNodeB2: eNodeB {
            @display("p=2726.4,1363.2");
        }
        eNodeB3: eNodeB {
            @display("p=539.6,2300.4");
        }
        eNodeB5: eNodeB {
            @display("p=3464.7998,2300.4");
        }
        eNodeB6: eNodeB {
            @display("p=1235.3999,3479");
        }
        eNodeB7: eNodeB {
            @display("p=2967.7998,3479");
        }
        eNodeB4: eNodeB {
            @display("p=1959.6,2300.4");
        }


        pgw: PgwStandard {
            @display("p=1959.6,2996.2");
        }
        router: Router {
            @display("p=2726.4,2300.4;i=device/smallrouter;is=s");
        }
        UPF1: StandardHost {
            @display("p=5083.5996,880.39996;i=device/server");
        }

        //#Veins Roads Visualizer
        roadsCanvasVisualizer: RoadsCanvasVisualizer {
            @display("p=6674,1576.2;is=s");
        }


        UPF3: StandardHost {
            @display("p=5083.5996,3805.5999;i=device/server");
        }

        AMF1: Router {
            @display("p=3734.5999,880.39996;i=device/smallrouter;is=s");
        }
        AMF2: Router {
            @display("p=3734.5999,3166.5999;i=device/smallrouter;is=s");
        }
        UPF2: StandardHost {
            @display("p=5083.5996,2570.2;i=device/server");
        }

        SMF1: Router {
            @display("p=4515.5996,880.39996;i=device/smallrouter;is=s");
        }
        SMF2: Router {
            @display("p=4402,3166.5999;i=device/smallrouter;is=s");
        }

    //        eNodeB8: eNodeB {
    //            @display("p=8934.64,6885.58");
    //        }
    //        eNodeB9: eNodeB {
    //            @display("p=9433.06,7365.54");
    //        }
    //        eNodeB10: eNodeB {
    //            @display("p=8934.64,8990.02");
    //        }
    connections allowunconnected:

        eNodeB7.ppp <--> Eth10G <--> pgw.pppg++;
        eNodeB2.ppp <--> Eth10G <--> pgw.pppg++;
        eNodeB3.ppp <--> Eth10G <--> pgw.pppg++;
        eNodeB6.ppp <--> Eth10G <--> pgw.pppg++;
        pgw.filterGate <--> Eth10G <--> router.pppg++;
        eNodeB1.ppp <--> Eth10G <--> pgw.pppg++;
        eNodeB5.ppp <--> Eth10G <--> pgw.pppg++;

        eNodeB1.x2++ <--> Eth10G <--> eNodeB2.x2++;
        eNodeB1.x2++ <--> Eth10G <--> eNodeB3.x2++;
        eNodeB2.x2++ <--> Eth10G <--> eNodeB5.x2++;
        eNodeB3.x2++ <--> Eth10G <--> eNodeB6.x2++;
        AMF1.pppg++ <--> Eth10G <--> router.pppg++;
        router.pppg++ <--> Eth10G <--> AMF2.pppg++;
        AMF1.pppg++ <--> Eth10G <--> SMF1.pppg++;
        SMF1.pppg++ <--> Eth10G <--> UPF1.pppg++;
        AMF2.pppg++ <--> Eth10G <--> SMF2.pppg++;
        SMF2.pppg++ <--> Eth10G <--> UPF3.pppg++;
        SMF2.pppg++ <--> Eth10G <--> UPF2.pppg++;

        eNodeB4.x2++ <--> Eth10G <--> eNodeB1.x2++;
        eNodeB4.x2++ <--> Eth10G <--> eNodeB2.x2++;
        eNodeB4.x2++ <--> Eth10G <--> eNodeB3.x2++;
        eNodeB4.x2++ <--> Eth10G <--> eNodeB5.x2++;
        eNodeB4.x2++ <--> Eth10G <--> eNodeB6.x2++;
        eNodeB4.x2++ <--> Eth10G <--> eNodeB7.x2++;
        eNodeB4.ppp <--> Eth10G <--> pgw.pppg++;

        eNodeB7.x2++ <--> Eth10G <--> eNodeB6.x2++;
        eNodeB7.x2++ <--> Eth10G <--> eNodeB5.x2++;

}

