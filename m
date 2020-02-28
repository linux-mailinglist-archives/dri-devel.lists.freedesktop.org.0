Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E21C172F70
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 04:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA0E6EDCE;
	Fri, 28 Feb 2020 03:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462C16E11A;
 Fri, 28 Feb 2020 03:38:11 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id q84so1570943oic.4;
 Thu, 27 Feb 2020 19:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MOGVYl0JiKEEseZ89TMjcjrll5qFG/jTKhgHEWQPkpc=;
 b=J8ATT3+9r2tl5tPUk47eknwKXzqIPXtzQZkx4jUV0w9sG8serBAUB4oLM2bAoVFxkE
 710swdy70mvVrM52QTuq8x4BORWKPVhXF7HSP0uEbbFwD8ZqBWOuNVaPCSEzB4j7wRRM
 r5k6O/So6AilgSEH6ZznlOhOVKRpVR5PEM9LCq7GNTn0v+NeJqTZR6iNxtePEHfiuIT3
 u3x4gAaG18htL0H/z4uf12qUHS+Aue2JsfwZ7/3afOEYBxnuOwkTYqbYjamn+YzEaPOy
 3ha8PFSgDkCw7Q2KJ7ako0D6mUUOwI7Z4AS/47VqohvKzFYe5LhqOqVbEFOSBX/URoBI
 IWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MOGVYl0JiKEEseZ89TMjcjrll5qFG/jTKhgHEWQPkpc=;
 b=Wz2Dzyz7P1y+XlP+0DExZr0W71GCeDKmHwGnPhDZ0Af6CicXnGzuDMkI0a8EZ3ZscA
 ijOu6Df3F+7CHisMtDd7as4KnlDe670BaWcBJ+WgOKkOWL6SvOy9kt9MeEvrD5A5ogki
 7heK0HKEgLuikew3I6v/j7YOykj8bG7uW+MxQTq28rjCwi5YtT9R5uNEI6felMXyiQ00
 vJk7R02eEHcVmcuvPH+h6WyHCowSxRVyDHdCmBRYEHez/KE6VD7PLS8BsjpmjNpiqgNG
 5Dbmjnj9+7otQx/O+j2OTukBVEIH3Mq1b+96Es1XagLi1gsNNnb9B8QVZuAt2VdWNEQP
 uuKQ==
X-Gm-Message-State: APjAAAX5ofhnmUW4dcsr4sJdykO98Qr7HBwsj6zfM+Ibqonptp9tfB0k
 9ftTT9yKp7JfwTE/Z9yUpM30vQHUaStICABLHZCXc27W
X-Google-Smtp-Source: APXvYqwpbwgHSiERR0+GiALBszLvfkpc7GvTh+wQG4QqsWDKdsEUGqd00n58Q4FHAO7dqcYN7bFx15SSsW/CTm89I/Q=
X-Received: by 2002:aca:bb54:: with SMTP id l81mr1648517oif.175.1582861090266; 
 Thu, 27 Feb 2020 19:38:10 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
In-Reply-To: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 28 Feb 2020 13:37:57 +1000
Message-ID: <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
Subject: Re: [Intel-gfx] gitlab.fd.o financial situation and impact on services
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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

On Fri, 28 Feb 2020 at 07:27, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
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

a) Ouch.

b) we probably need to take a large step back here.

Look at this from a sponsor POV, why would I give X.org/fd.o
sponsorship money that they are just giving straight to google to pay
for hosting credits? Google are profiting in some minor way from these
hosting credits being bought by us, and I assume we aren't getting any
sort of discounts here. Having google sponsor the credits costs google
substantially less than having any other company give us money to do
it.

If our current CI architecture is going to burn this amount of money a
year and we hadn't worked this out in advance of deploying it then I
suggest the system should be taken offline until we work out what a
sustainable system would look like within the budget we have, whether
that be never transferring containers and build artifacts from the
google network, just having local runner/build combos etc.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
