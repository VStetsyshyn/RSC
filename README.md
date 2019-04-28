# Lviv metro info point
People of Lviv, asked you to build metro schedule info point. This program will help tourists city of Lviv to:

- calculate timing between two stations;
- calculate cost between two stations;

In the end, you should be able to:

- Load configuration data from config file
- Calculate timing between 2 stations
- Calculate cost between 2 stations

Time and price defined for your variant can be found in file `timing.yml`
Variant 2
# Tips:
- Calculation is optimal by time or price.
- Possible security issues in the current app design:  

**YAML:**
Do not use YAML to load untrusted data. Doing so is unsafe and could allow malicious input to execute arbitrary code inside application.  

**SYMBOLS:**
'The MRI Ruby implementation uses Symbols internally for method, variable and constant names. The reason for this is that symbols are simply integers with names attached to them, so they are faster to look up in hashtables.

Once a symbol is created, the memory used by it is never freed. **If you convert user input to symbols with to_sym or intern, it is possible for an attacker to mount a denial of service attack against your application by flooding it with unique strings.** Because each string is kept in memory until the Ruby process exits, this will cause memory consumption to grow and grow until Ruby runs out of memory and crashes.
