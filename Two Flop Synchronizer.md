A two-flop synchronizer is a common technique used in digital design to safely transfer signals between different clock domains, minimizing the risk of metastability. It consists of two flip-flops in series, clocked by the destination clock.  
1. Metastability: The primary purpose of a two-flop synchronizer is to reduce the probability of metastability. Metastability occurs when a flip-flop's input changes close to its clock edge, causing an unpredictable output. The second flip-flop helps ensure that any metastable state in the first flip-flop has time to resolve before being passed on.
2. Limitations: While a two-flop synchronizer is effective for single-bit signals, it may not be suitable for multi-bit signals or data buses. For such cases, more complex synchronization techniques like FIFOs or handshaking protocols are recommended.
3. clock domain crossing: In digital electronic design a clock domain crossing (CDC), or simply clock crossing, is the traversal of a signal in a synchronous digital circuit from one clock domain into another. Different clock domains have clocks which have a different frequency, a different phase (due to either differing clock latency or a different clock source), or both.
4. Synchronizing a single bit signal to a clock domain with a higher frequency can be accomplished by registering the signal through a flip-flop that is clocked by the source domain, thus holding the signal long enough to be detected by the higher frequency clocked destination domain.

CDC metastability issues can occur between asynchronous clock domains; 
To avoid issues with CDC metastability in the destination clock domain, a minimum of 2 stages of re-synchronization flip-flops are included in the destination domain. 
Synchronizing a single bit signal traversing into clock domain with a slower frequency is more cumbersome. 
This typically requires a register in each clock domain with a form of feedback from the destination domain to the source domain, indicating that the signal was detected.
Other potential clock domain crossing design errors include glitches and data loss.

<img width="660" height="237" alt="image" src="https://github.com/user-attachments/assets/814130d0-3d23-4ba8-9c12-82acff9a2435" />

how 2 flop synchronization can remove metastability:

<img width="635" height="335" alt="image" src="https://github.com/user-attachments/assets/ca61abf2-0cac-4768-9e74-2b3aff1d6f68" />

when the first flip-flop (FF) data input violates the setup or hold time requirements, the output A/B becomes metastable. However, after an unpredictable delay (Tco), the FF output would settle to a stable logic level.
This is where the second FF comes in and prevent metastability from propagating throughout the design. 
As the metastable state would settle to a stable state after Tco, when captured by the second FF at the next rising edge of the clock, the Q1 output or D2 input data is likely to be already stable and there is likely no setup or hold time violation. 
Thus, FF2 can successfully store the stable logic level of Q1/D1 without metastability. In other words, the metastable state can be resolved by the second FF and the output of FF2 can be safely used by the next logic block.

<img width="424" height="265" alt="image" src="https://github.com/user-attachments/assets/4ee15313-91a4-40cc-9afa-b38401bacbb7" />

The higher the clock period of the destination clock, the smaller the probability of metastability propagating into the next logic blocks as this gives more time for the metastability to settle before captured by the second FF. 
Two-FF synchronizers are the most commonly used synchronizers in CDC design. Nevertheless, adding extra FFs to the synchronization chain as shown in the following figure would further improve the probability of preventing metastability from propagating. 
