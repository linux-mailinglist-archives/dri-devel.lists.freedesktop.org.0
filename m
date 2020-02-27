Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D987B172A18
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 22:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3486ED41;
	Thu, 27 Feb 2020 21:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8EB36ED44
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 21:27:16 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id d62so703690oia.11
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 13:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=53gRMBJrJ+la068BpgpeS9MvOB3v8Crv2gV5zCitRF4=;
 b=PhG78KEPgow20wemDEzeImA40/CuNsSFuDsT/XEp/QQGVqN6vIa5qNUqPIvnF2ottA
 uNl1BdrgGnLrYDDyNxhjwQPlzpKG0GynOaJ1dva71D7BjU4oUm/DimSOy1LST81ZGK6z
 NZNxQezRld7jYfF+RdkSDI+RuWI3WzXLHn95k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=53gRMBJrJ+la068BpgpeS9MvOB3v8Crv2gV5zCitRF4=;
 b=c2GqE/XknbgpnvtsaXa/VWJ3+ALW+QPICk7GZ7FjPkzTJq4fIBLw6eLQ6G+gkUgBiN
 mKh7GoS7VxNWR42XRRYOYnLayPhlpGi2a8AOl4i/nRIUnFB60geEXxrZ5u0ZgMvZeeMF
 jGaFKK4oOjUDPgdOOgjCZ6oykRlEuv//I8KSupx3KDG8T8p1/3eaV8hy6KIELeegQerh
 C2c+d5ya83ITCdk+vypmKjiUVORIOsE6RXXXVIvTh6+lzMtKAkIaaD4f6LexgT37VIiJ
 clMuH13/vX1oR0IqOLIBISbOzyzK2GG8deSETpEQZKLmm5/+XaXGb/KIoNNbCii+gocL
 4jOQ==
X-Gm-Message-State: APjAAAUmkzgxvGznVEYNG3PjuETqssyg9M0Eq+RWrokpby38M1nir+Lk
 oeoDdJ3dRnebGvhFgQMFT8pRt7QypnoYjHLdtIMRJA==
X-Google-Smtp-Source: APXvYqxrmwIIYpIUdfUeFAdLWb1JhkAvU4sEORizQCbTX2XxKpPE9DO4bzkdQ0PSrofOs/Ssn3ptbNPWgsoHCxXJc/U=
X-Received: by 2002:aca:2407:: with SMTP id n7mr851548oic.14.1582838835977;
 Thu, 27 Feb 2020 13:27:15 -0800 (PST)
MIME-Version: 1.0
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 27 Feb 2020 22:27:04 +0100
Message-ID: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
Subject: gitlab.fd.o financial situation and impact on services
To: gstreamer-devel@lists.freedesktop.org, Xorg Members List <members@x.org>, 
 Mesa Dev <mesa-dev@lists.freedesktop.org>, 
 "X.Org development" <xorg-devel@lists.x.org>,
 wayland <wayland-devel@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
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
Cc: "X.Org Foundation Board" <board@foundation.x.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

You might have read the short take in the X.org board meeting minutes
already, here's the long version.

The good news: gitlab.fd.o has become very popular with our
communities, and is used extensively. This especially includes all the
CI integration. Modern development process and tooling, yay!

The bad news: The cost in growth has also been tremendous, and it's
breaking our bank account. With reasonable estimates for continued
growth we're expecting hosting expenses totalling 75k USD this year,
and 90k USD next year. With the current sponsors we've set up we can't
sustain that. We estimate that hosting expenses for gitlab.fd.o
without any of the CI features enabled would total 30k USD, which is
within X.org's ability to support through various sponsorships, mostly
through XDC.

Note that X.org does no longer sponsor any CI runners themselves,
we've stopped that. The huge additional expenses are all just in
storing and serving build artifacts and images to outside CI runners
sponsored by various companies. A related topic is that with the
growth in fd.o it's becoming infeasible to maintain it all on
volunteer admin time. X.org is therefore also looking for admin
sponsorship, at least medium term.

Assuming that we want cash flow reserves for one year of gitlab.fd.o
(without CI support) and a trimmed XDC and assuming no sponsor payment
meanwhile, we'd have to cut CI services somewhere between May and June
this year. The board is of course working on acquiring sponsors, but
filling a shortfall of this magnitude is neither easy nor quick work,
and we therefore decided to give an early warning as soon as possible.
Any help in finding sponsors for fd.o is very much appreciated.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
