Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C33C7173F22
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 19:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15136E0DE;
	Fri, 28 Feb 2020 18:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB39A6F4A8;
 Fri, 28 Feb 2020 18:04:01 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id h5so1557396vsc.4;
 Fri, 28 Feb 2020 10:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qPM9qKUxW+tvu+nHraYgvpodBPKrrabdSOZuzexcQW4=;
 b=Vft3P9RCHZKCJoSYqwJR/wGO9OMbuPr51hTgWgPV+y/hmJ+zYFKFNEwR6fh38qSBdA
 BGzGhNMbhS2+oIItKjaPdrhwOVaT68R5F1JGAF5XZpb0bYZ2IUb2LZ9y7MKkIR2v0ri2
 z4hEBTnTFU/tHSmY0OFfYnc0xEpEevUrykTwccTnbB9lpMxNOSf49/piDmbNWWCFpZXJ
 sT7mG13C3QWBAnaVhfgiGorx27UvY7Z5tmZt/VRDSv5qDAw1ZsTxdlcjvpQSOvNX1QDz
 UNG9o1nb+UQXq/xifPWvoNoIyFJRlQMx1p9ORHQ1PQpL4hJFk4PtPBp//4qe5p344Q3r
 kxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qPM9qKUxW+tvu+nHraYgvpodBPKrrabdSOZuzexcQW4=;
 b=gn+WM+mmRmcryxortvTi663nVYxIhfUfrXRjfePndfhoSdzitYKjbcF1EEu2DEsShv
 yhdZ9xYpvPldVKjlqwPUaHssgxj2TPAPharfnXQr2Rr9s7sa8dmD6Y+sR5SfUrmDtHpO
 Gh8EnCnq73+8pGNuIofdNunDrh9uHOVrDvfrE5idzS2T4Wha6GHh98IO+IUIqeMbT52L
 yMn/MrMiJchxzMK1PgIqQUtJTJmdZfEIhiP9Xtmr4I5OlN1qtczs87kqh8Y2foMyFccF
 /LwnNjnfDKcAw1kTJZ288hHIh9hCYgNUJrII5FkVMnCmAxSihuYieYOKglTp/ZgFZ5Yp
 bI+A==
X-Gm-Message-State: ANhLgQ1k1Y8lQwo4KVdhiAC+i0Onb5l0MfOkPe62ETEANc12e1jzGaOQ
 Waqn5Xrv+K9GN6JxUM0ce4S5bFFHcrPcqk7/Mec=
X-Google-Smtp-Source: ADFU+vv5PJJYdw0HlTGK68jX0JVJsDv8ISEF+CNdsAjizFn5QhsF/+1hMHUlmSiIdSz/+6WSkYfFlFEW5CwoUT6kzms=
X-Received: by 2002:a67:cf46:: with SMTP id f6mr3366351vsm.143.1582913040412; 
 Fri, 28 Feb 2020 10:04:00 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
In-Reply-To: <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
From: =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
Date: Fri, 28 Feb 2020 10:03:49 -0800
Message-ID: <CAOeoa-e1erNAhwfHBm6ReB8qcjsUZwCNA0h_kdjf=zzmztZExQ@mail.gmail.com>
Subject: Re: [Intel-gfx] gitlab.fd.o financial situation and impact on services
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
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

On Thu, Feb 27, 2020 at 7:38 PM Dave Airlie <airlied@gmail.com> wrote:
>
> On Fri, 28 Feb 2020 at 07:27, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > Hi all,
> >
> > You might have read the short take in the X.org board meeting minutes
> > already, here's the long version.
> >
> > The good news: gitlab.fd.o has become very popular with our
> > communities, and is used extensively. This especially includes all the
> > CI integration. Modern development process and tooling, yay!
> >
> > The bad news: The cost in growth has also been tremendous, and it's
> > breaking our bank account. With reasonable estimates for continued
> > growth we're expecting hosting expenses totalling 75k USD this year,
> > and 90k USD next year. With the current sponsors we've set up we can't
> > sustain that. We estimate that hosting expenses for gitlab.fd.o
> > without any of the CI features enabled would total 30k USD, which is
> > within X.org's ability to support through various sponsorships, mostly
> > through XDC.
> >
> > Note that X.org does no longer sponsor any CI runners themselves,
> > we've stopped that. The huge additional expenses are all just in
> > storing and serving build artifacts and images to outside CI runners
> > sponsored by various companies. A related topic is that with the
> > growth in fd.o it's becoming infeasible to maintain it all on
> > volunteer admin time. X.org is therefore also looking for admin
> > sponsorship, at least medium term.
> >
> > Assuming that we want cash flow reserves for one year of gitlab.fd.o
> > (without CI support) and a trimmed XDC and assuming no sponsor payment
> > meanwhile, we'd have to cut CI services somewhere between May and June
> > this year. The board is of course working on acquiring sponsors, but
> > filling a shortfall of this magnitude is neither easy nor quick work,
> > and we therefore decided to give an early warning as soon as possible.
> > Any help in finding sponsors for fd.o is very much appreciated.
>
> a) Ouch.
>
> b) we probably need to take a large step back here.

If we're taking a step back here, I also want to recognize what a
tremendous success this has been so far and thank everybody involved
for building something so useful. Between gitlab and the CI, our
workflow has improved and code quality has gone up.  I don't have
anything useful to add to the technical discussion, except that that
it seems pretty standard engineering practice to build a system,
observe it and identify and eliminate bottlenecks. Planning never
hurts, of course, but I don't think anybody could have realistically
modeled and projected the cost of this infrastructure as it's grown
organically and fast.

Kristian

> Look at this from a sponsor POV, why would I give X.org/fd.o
> sponsorship money that they are just giving straight to google to pay
> for hosting credits? Google are profiting in some minor way from these
> hosting credits being bought by us, and I assume we aren't getting any
> sort of discounts here. Having google sponsor the credits costs google
> substantially less than having any other company give us money to do
> it.
>
> If our current CI architecture is going to burn this amount of money a
> year and we hadn't worked this out in advance of deploying it then I
> suggest the system should be taken offline until we work out what a
> sustainable system would look like within the budget we have, whether
> that be never transferring containers and build artifacts from the
> google network, just having local runner/build combos etc.
>
> Dave.
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
