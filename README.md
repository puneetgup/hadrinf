# High Availability - Disaster Recovery Guidance using practical real life scenarios
### Design for High Availability
Designing for High Availability focuses on ensuring that the Azure Solution you are building and deploying is available to withstand network, hardware and software failures to meet the uptime requirements for your solution
### Design for Disaster Recovery
Designing for Disaster Recovery focuses on how quickly your solution can recover from any disaster impacting the infrastructure your solution is hosted on and minimizing any data loss related to this disaster. The design needs to consider regional failure for your solution infrastructure and recovering to another region to meet the availability requirements for your solution
## Azure Express Route High availability with multi-region failover
Azure ExpressRoute lets you extend your on-premises networks into Microsoft Azure over a private connection facilitated by a network connectivity provider. Connectivity can be from any-to-any network, a point-to-point Ethernet network, or a virtual cross-connection through a connectivity provider at a co-location facility. ExpressRoute is designed for high availability to provide carrier grade private network connectivity to Microsoft resources, with no single point of failure in the ExpressRoute path within the Microsoft network. To maximize the availability, the customer and the service provider segment of your ExpressRoute circuit should also be architected for high availability. While there are multiple topologies for connectivity with Azure, one of the most frequently used topology is the Hub-Spoke Topology. The Hub is a virtual network (VNet) in Azure that acts as a central point of connectivity to your on-premises network. The spokes are VNets that peer with the hub, and can be used to isolate workloads. Traffic flows between the on-premises datacenter and the hub through Express Route circuits or VPN Gateway connections.
1. Express Route to on premise from primary Azure region
2. Express Route failover VPN in secondary Azure region
3. Azure Hub/Spoke with the Hub being a dedicated subscription and peers to spoke subscriptions of Production and Not Production (connecting both primary and secondary region)
4. Placement of Azure Firewall, NSGs, UDRs to protect inbound and outbound traffic (shaping, not forced tunneling).
### Scenario 1:
1. AFD with WAF to AppGW to App Services in each region
2. App Services (in order to effectively use Cosmos Private Link, let's use the ASE) is Hello World with the words Hello World as text in a multi-region Cosmos database to demonstrate multi-master - Cosmos enabled with Private Link perhaps?
3. App Services Hello World also calls "on prem" via ER (or the VPN failover) for something, maybe another line of text that says "I'm on prem and routing via (ER or VPN)"
### Scenario 2:
1. On premise, the customer uses VMWare and we'll use the HA setup to fail over from on premise to Azure
2. Hybrid with primary on prem and secondary in Azure with the same application approach as Scenario 1, instead of ASE and Cosmos, use VMs.
