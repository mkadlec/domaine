# Domaine
## An easy way to validate DKIM and SPF for any domain on the DNS

## Usage:

`Domaine.valid_dkim(<domain>, <selector>)`
`Domaine.valid_spf(<domain>)`

### Example:

`Domaine.valid_dkim('example-domain.com', 'sel1')`
and
`Domaine.valid_spf('example-domain.com')`

## Returns:

true or false
