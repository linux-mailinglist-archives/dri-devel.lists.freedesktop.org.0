Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA8A18B1BE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 11:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722E86E12F;
	Thu, 19 Mar 2020 10:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A026E12F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 10:53:36 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id h3so1791688ils.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 03:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mGv6o90nBAkHN8tZGMFBnMPu1+vfJLDuM2IfjimqHmY=;
 b=SP1ghtcxKDm86Nrinun/aUTKmLh8YvxfNs09WDEPx7kOtKCkXKDhc4YR8iqRTOp/gS
 8P5efpzV/FxasWeGMas6yKVOjmZHlN/U7Vcs0aJQgCFwJkVeQ69oXJHMx4/FdNA71uX6
 wqH9xxtU1P3ClcNJRgAKlGJ0idpOlYBjlQ2nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mGv6o90nBAkHN8tZGMFBnMPu1+vfJLDuM2IfjimqHmY=;
 b=p0iK3Nwqn8nN6bfDZpc+njP6n8xhwYDKUozfYWTORivBXdy2OkH+P//hMfNK+Svu2i
 WQ5HK3G/jWLXOJHsVQNiu8WloDKlUVXZTzn10jpcYZZ1YU3sahkuunWwrKyM6tWVYQOl
 yRPUcHhCxZdEgTlSnZKQjSEAFSpkMWHJr0jpFmI9x6OSiezJzvxYZfK2lUEKAWcebs53
 z3Mby2TGVrjux5bELfjFen1kcCfFD6oq5HTd8BOJzo4VmBVel55CQvIVAAqgNYALOymT
 7SHlhAAW/y00PRU3xBee8JkncrAjnwT5zuYgp9/KM82F9WbvV2yfYGZ74AWhIwmskLVV
 4EfA==
X-Gm-Message-State: ANhLgQ0TafYQYFcF6hPCxFNZKarwXXVC6hmcig7ewaLi2A1Asn/EIlSm
 T/V4NgcW/O9SimSw7mpWEKAhSGJ0pILMSFFHfJ6zzA==
X-Google-Smtp-Source: ADFU+vsvDXUclE/dotigec15em503ixvkYRgAZl9akg13dIVS4KGv/OyL1NGUG/SO0ckE6T2Lmn93e+sS5SELs6oRrU=
X-Received: by 2002:a92:77c2:: with SMTP id s185mr1287803ilc.297.1584615215203; 
 Thu, 19 Mar 2020 03:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200318171003.5179-1-jagan@amarulasolutions.com>
 <20200318171003.5179-3-jagan@amarulasolutions.com>
 <20200318185814.GB28092@ravnborg.org>
 <CAMty3ZDhVfvYXV7OO+NT+d_2YHbsJXebzjdtYkqtdD+X=Ch0yQ@mail.gmail.com>
 <20200319103159.GA18744@ravnborg.org>
In-Reply-To: <20200319103159.GA18744@ravnborg.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 19 Mar 2020 16:23:24 +0530
Message-ID: <CAMty3ZCjHALfw3Hws5A1M3jbjtkGgeerUZb-wnrppFtQ0dvpTg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] MAINTAINERS: Update feiyang, st7701 panel bindings
 converted as YAML
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Thu, Mar 19, 2020 at 4:02 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Jagan.
> On Thu, Mar 19, 2020 at 03:50:44PM +0530, Jagan Teki wrote:
> > On Thu, Mar 19, 2020 at 12:28 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > On Wed, Mar 18, 2020 at 10:40:03PM +0530, Jagan Teki wrote:
> > > > The feiyang,fy07024di26a30d.txt and sitronix,st7701.txt has been
> > > > converted to YAML schemas, update MAINTAINERS to match them again.
> > > >
> > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > >
> > > The patch is fine.
> > > I just dislike we repeat the maintainer info in two places..
> >
> > Since these are two different panels. and entry similar like other
> > panels.do you look for single entry for both the panels?
> My comment was related to the fact that we have maintainer entry in the
> .yaml file, and in MAINTAINERS.
>
> Seems a waste to have a distributed and a centralized place for this.
> So patches are fine in this respect.
> And merging the two bindings would be very bad, they are not alike.

Seems to be a valid point considering the redundant entry in two
places, but the idea of maintainer entry in binding vs MAINTAINER file
may be different in terms of usage, and knowing to public. the later
part is pretty generic for people to know, and checkpatch to find. I
may not be sure, but some experts can help here.

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
