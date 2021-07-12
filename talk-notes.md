## ## S1
Thank you, professor Helena.
Hi everyone, my name is Alberto Kummer. I am a Ph.D. Candidate on the Federal University of Rio Grande do Sul, in Brazil, and I will present our work titled "solving the single-day home health care problem with route interdependencies."

## S2
This is the outline of this presentation.

## S3
So starting from the introduction.

## S4
The home care systems have been studied since early 1974, and home care is frequently set as a complement to the traditional health systems.

The main idea of home care is to invert the roles "rolls" of the physicians and patients, so it is the health professional who goes from the hospital to the patient location. This way, the attendance is performed at the patient's home.

## S5
So there are several advantages in implementing this type of service.

First, it is more inclusive by allowing people with some disability or people with limited displacement to access more easily professional health services.

Second, it helps older people keep some level of independence and allows them to stay at home instead of moving to nurse homes or other similar facilities.

And third, it allows flexibility in dimensioning hospital facilities and helps leverage hospital beds for more complex health cases.

## S6
So we have all these advantages on implementing home care systems. Still, to maintain such systems, there is a demand for efficient solutions to several underlying complex problems, like the routing of caregivers to the patient locations.

## S7
So, what typically comes to mind when we think about home care is some variant of a vehicle routing problem that comprises some additional requirements.

So as you can see in this example, we have an instance of a very simple home care problem with an operations center in the middle and all these patients around this region. Each patient has a time window in which they can receive the visit of the caregiver.

## S8
In this example, a solution would be these routes, with this route for the blue caregiver and this other route for the red one. This way, all patients have their time window constraints fulfilled, with a total travel time of two hours considering both the caregivers.

## S9
So now we discuss a few aspects of the literature of the problem.

## S10
As I have mentioned before, the first paper on the home care literature is from early 1974, from the work of Aurora Fernandez, and since 2006, we can verify at least one new publication discussing home care systems per year.

## S11
As a result, we currently have a substantial volume of publications on this topic. And the tendency is to have even more publications in the following years, mainly due to the importance of such healthcare systems.

## S12
To condense most of the literature we have accessed, the majority of the publications discuss some routing problem. Often we observed variations on the objective functions used, and several works discuss additional constraints to model some working regulations or other requirements of this sort.

In fact, these two surveys from 2017 focus mainly on home care systems for the so-called home hospitalization, in which the patient moves from the hospital to follow up their treatment at their homes.

More recently, we saw other care approaches being served in the home care format. For example, a social care provider can offer professional assistance for older people on their day-to-day activities, helping them keep some level of independence.

## S13
In this presentation, we also discuss a routing problem arriving in a home care system context.

So, our first known publication approaching home care as a routing problem is from 98, from the work of Cheng and Rich. And despite all the 23 years of research following this first publication, we see no consensus on the literature regarding a standard routing problem in the home care context. In the same way, there is also no consensus on a common benchmark dataset for the general problem.

## S14
With all these observations set, we can further define the problem we are interested in solving.

## S15
And our major objective is to propose methods to solve a home care problem in Brazil.

So here in Brazil, we have this pilot program called "Better in-home" that aims to provide home care services broadly to the population, using for that the Brazilian public health resources.

This pilot program started in 2011, and its implementation is in progress in several big Brazilian cities. For example, São Paulo e Rio de Janeiro.

## S16
With this program in mind, our motivation is to solve a real problem of home care in Brazil, more specifically in Porto Alegre, which is the city where my university is located.

This "better in home" program focuses on home care for home hospitalization. For this reason, we guided our research effort on this specific format of home care, with the objective of transfer our knowledge to the managers of the program of Porto Alegre.

## S17
Currently, in Porto Alegre, 19 caregivers are working on the home hospitalization services, and on average, 300 patients are visited per week. And currently, the management of the system is entirely manual.

## S18
To manage the system, an experienced caregiver solves the problem manually in three steps. So the planning is done every day in de morning.

In the first step, the manager chooses which patients will be visited on the day.

In the second step, the manager assigns each patient to some caregiver by observing the patient's time windows and the working shift of the caregivers.

The last planning step is the individual routing of each caregiver, which the vehicle drivers usually do by following the "nearest neighbor" heuristic to select the visit order.

## S19
After some understanding of the practical problem, our methodology was then to search for what we call a core optimization problem in the home care literature.

So our objective is to find a complex enough problem which solution methods would be valuable for solving the real problem in Porto Alegre. Of course, as a Ph.D. candidate, I was also concerned about choosing a problem that is interesting from the scientific perspective.

## S20
And with this mindset, we found the "home health care routing and scheduling problem" that Mankowska proposed in 2014.

## S21
In this problem, the authors propose the routing of the caregivers and the scheduling of the patient visits. The papers also contain a formal definition of the problem through a mixed-integer programming model. Still, most importantly, the authors also published a benchmark dataset for the problem, which is freely available on the internet.

## S22
The problem considers a single-mode routing problem and patient time windows. It also considers multiple service types. Thus we can see the caregivers as heterogeneous regarding these service types. This way, demands of a specific service type can only be served by a qualified caregiver.

This problem also models the cases where a patient requires multiple visits to fulfill the demands of distinct services types. This also happens in the real problem of Porto Alegre, and for those cases, additional constraints are set to control how these multiple visits occur.

## S24
So the first case is when a patient requires two service types in a specific order. In this figure, the patient requires services 2 and 5, which must be fulfilled in this specific order. Additionally, a minimum and a maximum separation time are set between these two visits.

DO NOT READ! This way, caregiver 1 visits the patient to fulfill the demand of service type 2. And after this service is completed, caregiver 2 visit the patient to fulfill the other demand for service type 5.

## S25
The second case of multiple visits is more simples. In the cases of parallel attendances, it is required for both caregivers to be present at patient locations so both demands can be fulfilled simultaneously.

DO NOT READ! In the example of this figure, caregiver 1 arrives earlier on the patient home than caregiver 2, so the first caregiver has to wait for caregiver 2 to start the visits.

## S26
After introducing all these characteristics, we then need to define the objective function proposed in Mankowska's paper.

This problem contains a weighted objective with three components. The first component minimizes the caregivers' travel times; the second minimizes the total tardiness of the visits because, in this problem, the patients have soft time windows. And the third component minimizes the tardiest visit among the patients.

As you can see, this objective function combines at least two conflicting interests. For example, to reduce the tardiness of some visits, it may be necessary to increase the travel times of the caregivers a lot, and vice versa. But for now, we use the same approach as Mankowka of combining these components with the weight multipliers lambda 1, 2, and 3.

## S27
So now we present the solution methods proposed to solve this problem.

## S28
So the first method we propose to solve the problem is what we call a fix-and-optimize matheuristic, which uses the MIP model from Mankowska to develop what we call a MIP-based local search strategy.

In this algorithm, we apply Mankowska's constructive heuristic for providing an initial solution. In short, on each iteration, the matheuristic tries to optimize the routes of pairs of caregivers, and the search stops when the matheuristics stays on the same local optima by some iterations.

## S29
We also try to tackle the problem using pure meta-heuristics approaches, but as far as we know, local-search-based methods tend to be hard to implement and quite expensive to compute. There are a few implementation tricks from the VRP literature we could apply to devise more efficient evaluation algorithms. Still, typically, synchronization constraints require re-evaluating large chunks of the solution when applying local search operators.

So instead of optimizing the problem directly, we proposed an indirect search approach based on genetic algorithms.

## S30
Our genetic algorithm of choice is the biased random key genetic algorithm introduced by Golçalves and Resende in 2011.

In addition to the original method from 2011, we also test a more complex variation of the genetic algorithm that embeds several intensification components proposed by Andrade et al.

## S31
Entering now on the experimental results.

## S32
We benchmark our solution methods with the instance dataset proposed by Mankowska et al., which comprises 70 instances ranging from ten patients to 300 patients on the larger test cases.

## S33
So this table presents the average results from the literature and the average results we obtain with the matheuristic. The first thing to note is that Lasfargeas et al. did not provide solutions for instances larger than 75 patients.

Ok, so regarding the overall results, the best solutions for the instance subsets A to E are found by the fix-and-optimize algorithm. On larger test cases, the matheuristic fails in improving the initial solutions due to many multiple visit patients, consequently a large number of synchronization constraints.

For subset E, which comprises instances with 100 patients, the matheuristic produces, on average, solutions 18% better than the previous results reported in Mankowka's paper.

Despite that, in general, we observe a longer running time on the fix-and-optimize algorithm, which can be justified by the use of the MIP solver within the method.

## S34
The following table presents all the results we saw previously, plus the average results produced by the two variations of the genetic algorithm.

We notice how fast the simpler version of the BRKGA obtains solutions for the largest instances, requiring less than five minutes to produce solutions almost 21% better than Mankowska's method.

In general, the best solutions for instances up to subset C are produced by the fix-and-optimize matheuristic. In the larger test cases, the best method seems to be the genetic algorithm, especially the variant with the intensification components.

But there is a significant caveat of using this more sophisticated version of the genetic algorithm. To produce solutions on average 4.64% better, the more complex version of BRKGA takes up to five times the time required by the simpler version of the genetic algorithm.  In any way, the 20 minutes runtime of BRKGA-IC seems to be acceptable for solving these larger test cases.

## S35
Going into the conclusions.

## S36
For the fix-and-optimize matheuristic, our takeouts are the following.

First, the matheuristic is very flexible, and we can easily change the problem by simply manipulating the MIP model underneath it.

The matheuristic seems to be the "to-go" method for solving instances up to 75 nodes if the user can spend the time the algorithm requires to finish. As the biggest caveat, the efficiency of this solution method can be greatly impacted by the quality of the MIP solver applied to solve the subproblems.

## S37
As we have complete control over the code, we can also say that the genetic algorithm is also very flexible, and its usage is interesting with an instance of 75 patients on more.  The simpler version of the BRKGA is very fast and verified the effectiveness of the intensification components.

## S39
In conclusion, home care problems are a very complex and very interesting research topic.

And regarding the system of Porto Alegre, we see a large room for improvement in the home care operations. Currently, we are generating realistic instances based on our knowledge regarding the Porto Alegre system to test how well our solution methods would solve a real case.

S40
We want to improve our genetic algorithm's decoder in future works to have a better of some greedy decisions it made.

And we also want to model other practical requirements of Porto Alegre's system and propose methods to deal with the rescheduling needs.

S41
So these are the references we use in this presentation.

***
Thank you!

