The new email API, enabled via the _policy_ keyword to various constructors, is no longer provisional. The `[email`][163] documentation has been reorganized and rewritten to focus on the new API, while retaining the old documentation for the legacy API. (Contributed by R. David Murray in [bpo-24277][164].)

The `[email.mime`][165] classes now all accept an optional _policy_ keyword. (Contributed by Berker Peksag in [bpo-27331][166].)

The `[DecodedGenerator`][167] now supports the _policy_ keyword.

There is a new `[policy`][168] attribute, `[message_factory`][169], that controls what class is used by default when the parser creates new message objects. For the `[email.policy.compat32`][170] policy this is `[Message`][171], for the new policies it is `[EmailMessage`][172]. (Contributed by R. David Murray in [bpo-20476][173].)
