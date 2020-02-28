Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66199173248
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 08:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D17F6EE20;
	Fri, 28 Feb 2020 07:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from kirsty.vergenet.net (kirsty.vergenet.net [202.4.237.240])
 by gabe.freedesktop.org (Postfix) with ESMTP id CE07D6EDA0;
 Fri, 28 Feb 2020 00:33:14 +0000 (UTC)
Received: by kirsty.vergenet.net (Postfix, from userid 1001)
 id A566125B7C9; Fri, 28 Feb 2020 11:33:13 +1100 (AEDT)
Date: Fri, 28 Feb 2020 00:33:09 +0000
From: Carsten Haitzler (The Rasterman) <raster@rasterman.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: gitlab.fd.o financial situation and impact on services
Message-Id: <20200228003309.04491fcd60febda4870b5cbd@rasterman.com>
In-Reply-To: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
Organization: You expect me to be organized?
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
X-Mailman-Approved-At: Fri, 28 Feb 2020 07:59:27 +0000
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>, gstreamer-devel@lists.freedesktop.org,
 Mesa Dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Feb 2020 22:27:04 +0100 Daniel Vetter <daniel.vetter@ffwll.ch> said:

Might I suggest that given the kind of expenses detailed here, literally buying
1 - 4 reasonably specced boxes and hosting them at OSUOSL would be incredibly
cheaper? (we (enlightenment.org) have been doing so for years on a single
box). We farm out CI to travis via gihub mirrors as it's not considered
an essential core service (unlike mailing lists, git, phabricator whch nwe
still run - we can live without CI for a while and find other ways).

The cost is the odd HDD replacement every few years and maybe every 10y or so a
new box. That's a massively lower cost than you are quoting below.

OSUOSL provide bandwidth, power, rack space etc. for free. They have been
fantastic IMHO and the whole "no fat bills" is awesome and you get a full
system to set up any way you like. You just bring the box. That should drop cost
through the floor. It will require some setup and admin though.

> Hi all,
> 
> You might have read the short take in the X.org board meeting minutes
> already, here's the long version.
> 
> The good news: gitlab.fd.o has become very popular with our
> communities, and is used extensively. This especially includes all the
> CI integration. Modern development process and tooling, yay!
> 
> The bad news: The cost in growth has also been tremendous, and it's
> breaking our bank account. With reasonable estimates for continued
> growth we're expecting hosting expenses totalling 75k USD this year,
> and 90k USD next year. With the current sponsors we've set up we can't
> sustain that. We estimate that hosting expenses for gitlab.fd.o
> without any of the CI features enabled would total 30k USD, which is
> within X.org's ability to support through various sponsorships, mostly
> through XDC.
> 
> Note that X.org does no longer sponsor any CI runners themselves,
> we've stopped that. The huge additional expenses are all just in
> storing and serving build artifacts and images to outside CI runners
> sponsored by various companies. A related topic is that with the
> growth in fd.o it's becoming infeasible to maintain it all on
> volunteer admin time. X.org is therefore also looking for admin
> sponsorship, at least medium term.
> 
> Assuming that we want cash flow reserves for one year of gitlab.fd.o
> (without CI support) and a trimmed XDC and assuming no sponsor payment
> meanwhile, we'd have to cut CI services somewhere between May and June
> this year. The board is of course working on acquiring sponsors, but
> filling a shortfall of this magnitude is neither easy nor quick work,
> and we therefore decided to give an early warning as soon as possible.
> Any help in finding sponsors for fd.o is very much appreciated.
> 
> Thanks, Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> _______________________________________________
> xorg-devel@lists.x.org: X.Org development
> Archives: http://lists.x.org/archives/xorg-devel
> Info: https://lists.x.org/mailman/listinfo/xorg-devel
> 


-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
Carsten Haitzler - raster@rasterman.com

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
