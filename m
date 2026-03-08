Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOPTEaT2rWnH+AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 23:22:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2C92326A1
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 23:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096FA10E078;
	Sun,  8 Mar 2026 22:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com
 [216.40.44.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0957110E06E;
 Sun,  8 Mar 2026 22:22:23 +0000 (UTC)
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay06.hostedemail.com (Postfix) with ESMTP id 42DD81B91B3;
 Sun,  8 Mar 2026 22:22:21 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf03.hostedemail.com (Postfix) with ESMTPA id BD6C56000E; 
 Sun,  8 Mar 2026 22:22:14 +0000 (UTC)
Message-ID: <9fd14d166e860f26febfbc9061a6dcae6a166961.camel@perches.com>
Subject: Re: [PATCH v2 phy-next 24/24] MAINTAINERS: add regexes for linux-phy
From: Joe Perches <joe@perches.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, 	spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com
Date: Sun, 08 Mar 2026 15:22:13 -0700
In-Reply-To: <20260308205623.5trrqdmdrzj744hi@skbuf>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
 <20260308114009.2546587-25-vladimir.oltean@nxp.com>
 <ca170cbaf2f8bcbc89bbda68914d8e0d7640f0e7.camel@perches.com>
 <20260308191017.kcyi7ka5pktq5jl4@skbuf>
 <8c4c5d0c5d014d5cc19eb10906ca1bd83ffb3ce5.camel@perches.com>
 <20260308205623.5trrqdmdrzj744hi@skbuf>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Stat-Signature: zgtxuwsb3363ai68tf6p7s8zp8seinzy
X-Spam-Status: No, score=-0.14
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19wsONHcaef5rI729O90pckRr9dLrQEYXs=
X-HE-Tag: 1773008534-677296
X-HE-Meta: U2FsdGVkX19zIqgNUKb+c+5Mu7Q3C+Gpl/B+X8eI5i6bGv7WE3zpj355qMm6YCbRSW7Vrhs2aumEBIt791syA8wOI3oaCj+46xwg3qNvWJkp2gLycZfqNtZEDdNuGCB0y349Wog5E09dSEbmxlYo3wEry6L0kQTHpHQi1eemnMz3eHRJ8lW0g+PBe0pZnw/seBVjwauSFyG+tNp9GhFkZXlt5WBWbJRv4eXsvXAwTvZLp/ToUvk9BlaA2J9NhuyWc4djQ+wNnPyIbjEf3YbjCt97pmlbZeZatO9Oxpnpbki4SgQq7YX4GOxv15JoA/1s08cXIoR5CaQiUuDxwOWahT02urVywBVxEzsYACoHDQg9R+OY8J92EbaYAELi/zOh
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: EB2C92326A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.19 / 15.00];
	URIBL_BLACK(7.50)[perches.com:mid];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[perches.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.435];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joe@perches.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[perl.org:url]
X-Rspamd-Action: add header
X-Spam: Yes

On Sun, 2026-03-08 at 22:56 +0200, Vladimir Oltean wrote:
> On Sun, Mar 08, 2026 at 12:25:32PM -0700, Joe Perches wrote:
> > On Sun, 2026-03-08 at 21:10 +0200, Vladimir Oltean wrote:
> On Sun, Mar 08, 2026 at 11:40:44AM -0700, Joe Perches wrote:
> > > Perhaps if matching only the include uses:
> > > > (/ is escaped because get_maintainer is stupid)
> > > > something like:
> > > >=20
> > > > K:	include\s*\<linux\/phy\/phy(?:-common-props|-provider)?\.h\>
>=20
> > > Why is get_maintainer stupid?
> >=20
> > The get_maintainer code used to match keywords is
> >=20
> 	    foreach my $line (keys %keyword_hash) {
> 		if ($text =3D~ m/$keyword_hash{$line}/x) {
> >=20
> > so it seems the first / in the K: <foo> regex would terminate
> > the match.
> >=20
> > It might have been better to use a different delimiter.
> > Maybe:
> >=20
> 		if ($text =3D~ m{$keyword_hash{$line}}/x
>=20
> So why does it match in my example?

Not sure really.  But it does match exactly.
Maybe the regex code scans forward until the last /
as the / character is not a "real" metacharacter.

I added some test code and it produced:

line:	<+#include <linux/phy/phy.h>>
kw:	<(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)>
test:	<^[+-].*(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)>
match:	<+#include <linux/phy/phy.h>

From https://perldoc.perl.org/perlrequick

Not all characters can be used 'as is' in a match.
Some characters, called metacharacters, are considered special,
and reserved for use in regex notation. The metacharacters are

{}[]()^$.|*+?\

A metacharacter can be matched literally by putting a backslash before it:

"2+2=3D4" =3D~ /2+2/;    # doesn't match, + is a metacharacter
"2+2=3D4" =3D~ /2\+2/;   # matches, \+ is treated like an ordinary +
'C:\WIN32' =3D~ /C:\\WIN/;                       # matches
"/usr/bin/perl" =3D~ /\/usr\/bin\/perl/;  # matches

In the last regex, the forward slash '/' is also backslashed, because it is=
 used to delimit the regex.
