Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF61175562
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 09:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC0D6E0EC;
	Mon,  2 Mar 2020 08:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7251A6E394;
 Sat, 29 Feb 2020 18:14:08 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id u9so949660wml.3;
 Sat, 29 Feb 2020 10:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=/YOqBOlJrUI1flDmCuCHKMLtepW5A1wxOXV1iaBg5Zg=;
 b=Xw6Smsm8KtPM8OC991PrJ6I786aMOsrvMXt1LNA+ZTZjcWFCTSRhzx4E7eerOI+a8j
 oirw2M/flraj1u+/g0rD4SlLa1fFaOxplRfeTh6WwIyFi/ubTU/zJE1TL5zj5sKiGhoS
 hg+9wP+nO8f8NMjraZpQ8zxLltzT4MOn9OmU8o80FXyP+9sUr9tHjF4Dl7QMkvPubXC9
 aXVrj/nt2PHVkvdzjUSvnKEi1IC5JIm917IFIdb8ZOQOctwNbo1HObb+J35cRrUH3OaP
 l0S0RzxJ2gCGYIZN2NjBayG9byD+NmRtGE5cxMINgLXSl28hs1Q1Z/mK4NJzO4CFRILw
 Gktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=/YOqBOlJrUI1flDmCuCHKMLtepW5A1wxOXV1iaBg5Zg=;
 b=KjZxRb+ow7AYVhTESjeVLfUkGEUXXvVj4NkjyJaeG++/63+gHGpnP1oGvjfa9lRKex
 rGlrQW2ByE/bDo/3MU5c3tdEmckpsvHn7fXrfWVtar5i45q1BVMHgB6GgGAXmsZnZVYr
 Zyh2ExXO1dKLx7ro6fO4OlYb7TQwURhWqkHRaQm0W7pmTuu9ORpNc9nW1Q7L6RqPhyJc
 mO/gaqFVmsbwWkjjnhIrgD1DaXLDGj3UDrBZwiOcNT5/Pn+E8NB/wG78odJVZIlg22uw
 anYSYJaZHh/rdHe2LR4Sj52aY8xTJDxcW0RwYlkcfRVqKr64VF0eT2C1+dCzlfVOyRRf
 lq8w==
X-Gm-Message-State: APjAAAW8qTFugrlUKM2EEtGXdP1hRd4FF4WEm6hWQ2SH1juBMBT0IYqd
 4DhCaD78xsHgy9dTP5vO0Q4=
X-Google-Smtp-Source: APXvYqyRtFe1dg/neYu3kj9xZXUEpYq4gJN/mXtTelG04QTVkriVeOk06WCBQ0T+b6cxQbLv5W5Jyw==
X-Received: by 2002:a1c:bc46:: with SMTP id m67mr10367591wmf.40.1583000047136; 
 Sat, 29 Feb 2020 10:14:07 -0800 (PST)
Received: from Timur-XPS ([2a02:ab88:3846:1b00:9eb6:d0ff:fe89:c25f])
 by smtp.gmail.com with ESMTPSA id i8sm12579747wrq.10.2020.02.29.10.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Feb 2020 10:14:06 -0800 (PST)
Message-ID: <59f4ea1f13a9a9d37f7801b93061b4ae7dd595e2.camel@gmail.com>
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and
 impact on services
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Daniel Stone <daniel@fooishbar.org>, Erik Faye-Lund
 <erik.faye-lund@collabora.com>
Date: Sat, 29 Feb 2020 19:14:04 +0100
In-Reply-To: <CAPj87rO7BuKQj2Kei3T7RdkFq5=TiuShBvtrPU2sn0iqMfXSTg@mail.gmail.com>
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
 <b398161ff7d0268454413058dc6c194cf93f5990.camel@collabora.com>
 <ece8ebe3-40ec-2457-02da-4fef19cbe8f6@intel.com>
 <6d2ec570f957b4504fb70e0b1f0632712a99dc0c.camel@collabora.com>
 <CAPj87rO7BuKQj2Kei3T7RdkFq5=TiuShBvtrPU2sn0iqMfXSTg@mail.gmail.com>
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Mar 2020 08:17:47 +0000
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

On Fri, 2020-02-28 at 10:43 +0000, Daniel Stone wrote:
> On Fri, 28 Feb 2020 at 10:06, Erik Faye-Lund
> <erik.faye-lund@collabora.com> wrote:
> > On Fri, 2020-02-28 at 11:40 +0200, Lionel Landwerlin wrote:
> > > Yeah, changes on vulkan drivers or backend compilers should be
> > > fairly
> > > sandboxed.
> > > 
> > > We also have tools that only work for intel stuff, that should
> > > never
> > > trigger anything on other people's HW.
> > > 
> > > Could something be worked out using the tags?
> > 
> > I think so! We have the pre-defined environment variable
> > CI_MERGE_REQUEST_LABELS, and we can do variable conditions:
> > 
> > https://docs.gitlab.com/ee/ci/yaml/#onlyvariablesexceptvariables
> > 
> > That sounds like a pretty neat middle-ground to me. I just hope
> > that
> > new pipelines are triggered if new labels are added, because not
> > everyone is allowed to set labels, and sometimes people forget...
> 
> There's also this which is somewhat more robust:
> https://gitlab.freedesktop.org/mesa/mesa/merge_requests/2569

My 20 cents:

1. I think we should completely disable running the CI on MRs which are
marked WIP. Speaking from personal experience, I usually make a lot of
changes to my MRs before they are merged, so it is a waste of CI
resources.

2. Maybe we could take this one step further and only allow the CI to
be only triggered manually instead of automatically on every push.

3. I completely agree with Pierre-Eric on MR 2569, let's not run the
full CI pipeline on every change, only those parts which are affected
by the change. It not only costs money, but is also frustrating when
you submit a change and you get unrelated failures from a completely
unrelated driver.

Best regards,
Timur

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
