Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2061C46A4
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 21:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE286E158;
	Mon,  4 May 2020 19:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0050.hostedemail.com
 [216.40.44.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB6A6E158
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 19:04:06 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 90A1018022F46;
 Mon,  4 May 2020 19:04:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2553:2559:2562:2693:2731:2828:2895:2902:3138:3139:3140:3141:3142:3352:3622:3867:3868:3870:3872:3874:4321:5007:6742:6743:7903:10004:10400:10848:11232:11658:11914:12043:12297:12740:12895:13069:13075:13161:13229:13311:13357:13439:13894:14096:14097:14180:14659:14721:14777:21060:21080:21627:21939:30026:30054:30060:30070:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: scarf42_6021543c5600
X-Filterd-Recvd-Size: 2806
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Mon,  4 May 2020 19:04:01 +0000 (UTC)
Message-ID: <7af4a2979fb5c060af769a996d3e5917b4d265d0.camel@perches.com>
Subject: Re: [PATCH] docs: dt: fix broken links due to txt->yaml renames
From: Joe Perches <joe@perches.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sam Ravnborg <sam@ravnborg.org>
Date: Mon, 04 May 2020 12:04:00 -0700
In-Reply-To: <20200504175553.jdm7a7aabloevxba@pengutronix.de>
References: <967df5c3303b478b76199d4379fe40f5094f3f9b.1588584538.git.mchehab+huawei@kernel.org>
 <20200504174522.GA3383@ravnborg.org>
 <20200504175553.jdm7a7aabloevxba@pengutronix.de>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
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
Cc: alsa-devel@alsa-project.org, Olivier Moysan <olivier.moysan@st.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Jyri Sarha <jsarha@ti.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-05-04 at 19:55 +0200, Uwe Kleine-K=F6nig wrote:
> Hi Sam,
> =

> On Mon, May 04, 2020 at 07:45:22PM +0200, Sam Ravnborg wrote:
> > On Mon, May 04, 2020 at 11:30:20AM +0200, Mauro Carvalho Chehab wrote:
> > > There are some new broken doc links due to yaml renames
> > > at DT. Developers should really run:
> > > =

> > > 	./scripts/documentation-file-ref-check
> > > =

> > > in order to solve those issues while submitting patches.
> > Would love if some bot could do this for me on any patches that creates
> > .yaml files or so.
> > I know I will forget this and it can be automated.
> > If I get a bot mail that my patch would broke a link I would
> > have it fixed before it hits any tree.
> =

> What about adding a check to check_patch?

There's already a checkpatch warning when a patch renames
a file without a MAINTAINERS update.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
