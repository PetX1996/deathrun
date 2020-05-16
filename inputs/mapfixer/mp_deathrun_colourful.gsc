InSIniting()
{
    // Entities
    eEnt = custom\include\_mapfixerutil::Entity_Spawn("trigger_radius", (86.3675, -11.9009, 688.125), "dr2_t_endmap", 150, 50);
    eEnt custom\include\_mapfixerutil::Entity_Property("origin", (381.299, -611.186, 686.874));
    eEnt custom\include\_mapfixerutil::Entity_Property("radius", 150);


    // BoxGroups

    // Spawns

    // EndMapTrigger
    custom\include\_mapfixer::RegEM("trigger_radius", (86.3675, -11.9009, 688.125), "dr2_t_endmap");

    // TrapTriggers

}
