Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2E117354E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 11:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D73A6EEC4;
	Fri, 28 Feb 2020 10:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A446EEC4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 10:27:32 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1j7cre-0003UL-7U; Fri, 28 Feb 2020 11:27:26 +0100
Message-ID: <b34dfe8f624c0e1bc1a69cde74eb0d621cd52caa.camel@pengutronix.de>
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and
 impact on services
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Erik Faye-Lund
 <erik.faye-lund@collabora.com>
Date: Fri, 28 Feb 2020 11:27:25 +0100
In-Reply-To: <CAKMK7uEnE0HaB2Hs0opw5LO9YEkbJAOp3h5dvESHKFLvnzgfhQ@mail.gmail.com>
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
 <b398161ff7d0268454413058dc6c194cf93f5990.camel@collabora.com>
 <CAKMK7uEnE0HaB2Hs0opw5LO9YEkbJAOp3h5dvESHKFLvnzgfhQ@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 gstreamer-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fr, 2020-02-28 at 10:47 +0100, Daniel Vetter wrote:
> On Fri, Feb 28, 2020 at 10:29 AM Erik Faye-Lund
> <erik.faye-lund@collabora.com> wrote:
> > On Fri, 2020-02-28 at 13:37 +1000, Dave Airlie wrote:
> > > On Fri, 28 Feb 2020 at 07:27, Daniel Vetter <daniel.vetter@ffwll.ch>
> > > wrote:
> > > > Hi all,
> > > > 
> > > > You might have read the short take in the X.org board meeting
> > > > minutes
> > > > already, here's the long version.
> > > > 
> > > > The good news: gitlab.fd.o has become very popular with our
> > > > communities, and is used extensively. This especially includes all
> > > > the
> > > > CI integration. Modern development process and tooling, yay!
> > > > 
> > > > The bad news: The cost in growth has also been tremendous, and it's
> > > > breaking our bank account. With reasonable estimates for continued
> > > > growth we're expecting hosting expenses totalling 75k USD this
> > > > year,
> > > > and 90k USD next year. With the current sponsors we've set up we
> > > > can't
> > > > sustain that. We estimate that hosting expenses for gitlab.fd.o
> > > > without any of the CI features enabled would total 30k USD, which
> > > > is
> > > > within X.org's ability to support through various sponsorships,
> > > > mostly
> > > > through XDC.
> > > > 
> > > > Note that X.org does no longer sponsor any CI runners themselves,
> > > > we've stopped that. The huge additional expenses are all just in
> > > > storing and serving build artifacts and images to outside CI
> > > > runners
> > > > sponsored by various companies. A related topic is that with the
> > > > growth in fd.o it's becoming infeasible to maintain it all on
> > > > volunteer admin time. X.org is therefore also looking for admin
> > > > sponsorship, at least medium term.
> > > > 
> > > > Assuming that we want cash flow reserves for one year of
> > > > gitlab.fd.o
> > > > (without CI support) and a trimmed XDC and assuming no sponsor
> > > > payment
> > > > meanwhile, we'd have to cut CI services somewhere between May and
> > > > June
> > > > this year. The board is of course working on acquiring sponsors,
> > > > but
> > > > filling a shortfall of this magnitude is neither easy nor quick
> > > > work,
> > > > and we therefore decided to give an early warning as soon as
> > > > possible.
> > > > Any help in finding sponsors for fd.o is very much appreciated.
> > > 
> > > a) Ouch.
> > > 
> > > b) we probably need to take a large step back here.
> > > 
> > 
> > I kinda agree, but maybe the step doesn't have to be *too* large?
> > 
> > I wonder if we could solve this by restructuring the project a bit. I'm
> > talking purely from a Mesa point of view here, so it might not solve
> > the full problem, but:
> > 
> > 1. It feels silly that we need to test changes to e.g the i965 driver
> > on dragonboards. We only have a big "do not run CI at all" escape-
> > hatch.
> > 
> > 2. A lot of us are working for a company that can probably pay for
> > their own needs in terms of CI. Perhaps moving some costs "up front" to
> > the company that needs it can make the future of CI for those who can't
> > do this
> > 
> > 3. I think we need a much more detailed break-down of the cost to make
> > educated changes. For instance, how expensive is Docker image
> > uploads/downloads (e.g intermediary artifacts) compared to build logs
> > and final test-results? What kind of artifacts?
> 
> We have logs somewhere, but no one yet got around to analyzing that.
> Which will be quite a bit of work to do since the cloud storage is
> totally disconnected from the gitlab front-end, making the connection
> to which project or CI job caused something is going to require
> scripting. Volunteers definitely very much welcome I think.

It's very surprising to me that this kind of cost monitoring is treated
as an afterthought, especially since one of the main jobs of the X.Org
board is to keep spending under control and transparent.

Also from all the conversations it's still unclear to me if the google
hosting costs are already over the sponsored credits (so is burning a
hole into X.org bank account right now) or if this is only going to
happen at a later point in time.

Even with CI disabled it seems that the board estimates a cost of 30k
annually for the plain gitlab hosting. Is this covered by the credits
sponsored by google? If not, why wasn't there a board voting on this
spending? All other spending seem to require pre-approval by the board.
Why wasn't gitlab hosting cost discussed much earlier in the public
board meetings, especially if it's going to be such an big chunk of the
overall spending of the X.Org foundation?

Regards,
Lucas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
