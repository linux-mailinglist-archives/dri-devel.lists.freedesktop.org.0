Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001DB172C76
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 00:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F706ED99;
	Thu, 27 Feb 2020 23:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95096ED91;
 Thu, 27 Feb 2020 23:45:49 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id c17so1480257ioc.4;
 Thu, 27 Feb 2020 15:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1B5cN28SaJ3/7WiYYba2l3AKZHNwulNb8NyplqhuBOs=;
 b=Z3z5rt29E9KOgfeFf6qCq9MjwtZGyuIZ6WEAHMoajGLIRJ3zgmhdrxOsS7PI7d3yRS
 iyM/GaMhiIE5Q06VJ9Jns2pP+fh7gKhZKWQaZvDGfmCqQsvQOw4g6wxS2WJQ8OgZQFfZ
 NohH4T4HHs/e2cvyQ69ZC2ZFWj15HwVaZDg5bW+VytrvU5dpGCaDNh/GoiNhj+lH0zHI
 /ycO/9+++E1MkEyzCTy7Nn0MWghRqHiJbtba4oKO383QqmrjECP3+d+z1tv3IkPVbys1
 RFESaw8uF7hEeIOk46wpjmAAjewXmgXuqxVsk5o0CrkPrhf62fzW48pOFtJ7k+Ed1UNh
 G8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1B5cN28SaJ3/7WiYYba2l3AKZHNwulNb8NyplqhuBOs=;
 b=OFWHLDKahnE+7pvwVe6SdI1gtlsoUiQ6AaCCxbUAr7uej8yaZzDXQUZlgM4gOaDdHG
 qWyR7+4ejIosMhrfwki4nadZll/xgemIaBDzX9TUx4nk+Iok7YyMsviVbJy8gAMCkUz5
 cH8BZ3airgaUWhBxg442t1tYzEE+3Tyx6dEPkyEXdqI6if17s/vS6BCKvgYTPjDdZn7v
 0Q/9D/J+BtoW9uhWp8Bwa3Ppswstw+uohPyBlZEN5THkJ0BNyyXnnDBOo3r7yqfVuWJe
 pBuO7deOF3gvu3Kyv1z7blaINQm19zJHLsMRmaCTomgNfAQkrHrOYfXg36LR7s4Ee2e1
 YYbw==
X-Gm-Message-State: APjAAAVGp4YBOiWWuADbz5CNt0l06iFtkmoVFiXqnT3ZVBihAaTACnoj
 gwrLER0tkYQcb99Kl3z+2sdxTfcpH4e3+aLUiXthZEYR
X-Google-Smtp-Source: APXvYqyxmb9tZMjLW10xOdk3YABUj+dlD635ZiB2Xt1Km3UfiQCLGbV6CEkQ4tzddFAwcsD0Xk5ZgLBH9qYQlGV9NU4=
X-Received: by 2002:a02:856a:: with SMTP id g97mr1070308jai.97.1582847149085; 
 Thu, 27 Feb 2020 15:45:49 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
In-Reply-To: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 27 Feb 2020 15:45:36 -0800
Message-ID: <CAEdQ38Hr-L6rg80Gf18QNM7eK-QDK0BBU-9tChT6VxrP+T4qCw@mail.gmail.com>
Subject: Re: gitlab.fd.o financial situation and impact on services
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

On Thu, Feb 27, 2020 at 1:27 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
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

Some clarification I got from Daniel in a private conversation, since
I was confused about what the money was paying for exactly:

We're paying 75K USD for the bandwidth to transfer data from the
GitLab cloud instance. i.e., for viewing the https site, for
cloning/updating git repos, and for downloading CI artifacts/images to
the testing machines (AFAIU).

I was not aware that we were being charged for anything wrt GitLab
hosting yet (and neither was anyone on my team at Intel that I've
asked). This... kind of needs to be communicated.

A consistent concern put forth when we were discussing switching to
GitLab and building CI was... how do we pay for it. It felt like that
concern was always handwaved away. I heard many times that if we
needed more runners that we could just ask Google to spin up a few
more. If we needed testing machines they'd be donated. No one
mentioned that all the while we were paying for bandwidth... Perhaps
people building the CI would make different decisions about its
structure if they knew it was going to wipe out the bank account.

What percentage of the bandwidth is consumed by transferring CI
images, etc? Wouldn't 75K USD would be enough to buy all the testing
machines we need and host them within Google or wherever so we don't
need to pay for huge amounts of bandwidth?

I understand that self-hosting was attractive so that we didn't find
ourselves on the SourceForge-equivalent hosting platform of 2022, but
is that risk real enough to justify spending 75K+ per year? If we were
hosted on gitlab.com or github.com, we wouldn't be paying for
transferring CI images to CI test machines, etc, would we?

So what do we do now? Have we painted ourselves into a corner?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
