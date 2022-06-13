Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBDE548108
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 10:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C83B10E823;
	Mon, 13 Jun 2022 08:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AA610F072;
 Mon, 13 Jun 2022 07:43:47 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id gd1so4921931pjb.2;
 Mon, 13 Jun 2022 00:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zi4JNABJVD2gzP5+MmR3RP0e27QVnKtlx7lYCRbwomI=;
 b=Y+ItUvEtVKvFhFfXQN4VIsPfiBnV/QnRI/wdAGHEEEnOFtbYEhZVKpEpwaXeCp+XQ1
 ftOVVinvC0QtxBcaWMKgSkHJZGwg5YR+uTBoSHzVcjhWdWawIlWSKWJnrTbIkj5gaHC+
 E4n4dV1qT+vfGs+Yxr8bRrJ4ZgCdz3plzj1coCotYM0s0rxBOH8F5BNqnghyMhnBTYks
 UU/qDe0yGyXAaagQTZX8u5yF0DTaZHPysYFr42p+BtFfa4EISh9uCtWoHstks4Na45hS
 d00yrajCiN48By/Bc8Co1uBipgScyJ3sGTCig0D9ETCzYsDqSjeiV4KCvXHrVEDvYvl+
 HqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zi4JNABJVD2gzP5+MmR3RP0e27QVnKtlx7lYCRbwomI=;
 b=fc9YxOhr+b3oQ4BrkHtZmK6QUdBE2BbImt9BrjL/947JRgUjvbBs7Olk5gPz1m0TG1
 QVPWHDXAyxMVCo9AoQ2fBz7p8U71aq1FdNGTYzRu+Vqjp1h3QEzPQa+MrwCRf0xF+Crl
 lvwXbRI7zUS/cddnDpR/tVkp4K4AGLIglwfVCtKqsiQbJquVEjoskMimKQ9eSCOu2Ved
 MhZJ21XxZVZpk6ww+E2KUKXvKoGbxxyCof1vZYW1FbKOo4ywAOEQMCzBaqAn4XA3dji3
 7fQ18IhbKhd4Ze9gHRtEfXJBa0g9yhOFqJ0cwgQAti8F3/9A6kweVwodRSm0u30qBOpz
 eq8Q==
X-Gm-Message-State: AOAM5309H/DoW1ehgBaTXaFB9bmmflunrKqwxwN3iYtSrz+HsJC9FJ2M
 OD1BHtgYrXl/aexcMKXVcJEHAudoB7XCSZZl4jSVMMA8IPXTJQ==
X-Google-Smtp-Source: ABdhPJws1POn7mmwm8mzNJ7PpbOGODq68ExMTpyF7SvcawnphhiTdoxvstqy9sG92NkEwworg2zQta9tTwl6JmNa9gQ=
X-Received: by 2002:a17:902:c745:b0:166:496a:b455 with SMTP id
 q5-20020a170902c74500b00166496ab455mr52644669plq.135.1655106227438; Mon, 13
 Jun 2022 00:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <304E860A-A638-45D1-9AF3-F121A31CF7B0@apple.com>
 <Yqa6aWa70/GqhAHO@quokka>
 <CAPj87rPHKmFq2-VTWEJH_iVe2R7xvmb44v_ZWcQ9VakhF+5ArA@mail.gmail.com>
In-Reply-To: <CAPj87rPHKmFq2-VTWEJH_iVe2R7xvmb44v_ZWcQ9VakhF+5ArA@mail.gmail.com>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Mon, 13 Jun 2022 09:43:35 +0200
Message-ID: <CADo9pHh6UsjCZs_5Rngr6w=vaOosGOY5ufAmjW0dMquZ3hTxBA@mail.gmail.com>
Subject: Re: [fdo] 504 to gitlab.freedesktop.org
To: Daniel Stone <daniel@fooishbar.org>
Content-Type: multipart/alternative; boundary="000000000000c089a205e14f72e9"
X-Mailman-Approved-At: Mon, 13 Jun 2022 08:00:14 +0000
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
Cc: xorg-devel@lists.freedesktop.org, freedesktop@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Peter Hutterer <peter.hutterer@who-t.net>, sitewranglers@lists.freedesktop.org,
 Jeremy Sequoia <jeremyhu@apple.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000c089a205e14f72e9
Content-Type: text/plain; charset="UTF-8"

https://www.phoronix.com/scan.php?page=news_item&px=FreeDesktop-GitLab-2022-Crash

On Mon, Jun 13, 2022 at 9:40 AM Daniel Stone <daniel@fooishbar.org> wrote:

> On Mon, 13 Jun 2022 at 05:17, Peter Hutterer <peter.hutterer@who-t.net>
> wrote:
> > On Sun, Jun 12, 2022 at 05:57:05PM -0700, Jeremy Sequoia wrote:
> > > I was going to spend a little bit of time putting out an update to
> XQuartz
> > > to address a few bugs that I've been meaning to squash, but I'm having
> a bit
> > > of an issue pulling down sources.
> > >
> > > Fetching via ssh://git@gitlab.freedesktop.org is giving me Permission
> denied
> > > (publickey,keyboard-interactive).  I'm not sure if the latter is an
> infra
> > > issue or if the ssh key I have stored in my gitlab account are out of
> date
> > > (it's been about a year since I touched this).  Unfortunately, I can't
> seem
> > > to access https://gitlab.freedesktop.org to check as it's constantly
> > > presenting me a 504 Gateway timeout.
> > >
> > > Is anyone else able to pull sources via ssh://
> git@gitlab.freedesktop.org
> > > right now?  Is someone looking into the 504 issue?
> >
> > not an fdo admin but judging by the chatter on #freedesktop: no and yes,
> in
> > that order. seems like the infrastructure is in various stages of
> depositing
> > fecal matter on itself and the fixes are involved enough that the admins
> have
> > to be mentally awake, not merely physically.
>
> Yes, that's what's happening. Our (multi-host-replicated etc) Ceph
> storage setup has entered a degraded mode due to the loss of a couple
> of disks - no data has been lost but the cluster is currently unhappy.
> We're walking through fixing this, but have bumped into some other
> issues since, including a newly-flaky network setup, and changes since
> we last provisioned a new storage host.
>
> We're working through them one by one and will have the service back
> up with all our data intact - hopefully in a matter of hours but we
> have no firm ETA right now.
>
> Cheers,
> Daniel
>

--000000000000c089a205e14f72e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a href=3D"https://www.phoronix.com/scan.php?page=3Dnews_i=
tem&amp;px=3DFreeDesktop-GitLab-2022-Crash">https://www.phoronix.com/scan.p=
hp?page=3Dnews_item&amp;px=3DFreeDesktop-GitLab-2022-Crash</a></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 1=
3, 2022 at 9:40 AM Daniel Stone &lt;<a href=3D"mailto:daniel@fooishbar.org"=
>daniel@fooishbar.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Mon, 13 Jun 2022 at 05:17, Peter Hutterer &lt;<a hr=
ef=3D"mailto:peter.hutterer@who-t.net" target=3D"_blank">peter.hutterer@who=
-t.net</a>&gt; wrote:<br>
&gt; On Sun, Jun 12, 2022 at 05:57:05PM -0700, Jeremy Sequoia wrote:<br>
&gt; &gt; I was going to spend a little bit of time putting out an update t=
o XQuartz<br>
&gt; &gt; to address a few bugs that I&#39;ve been meaning to squash, but I=
&#39;m having a bit<br>
&gt; &gt; of an issue pulling down sources.<br>
&gt; &gt;<br>
&gt; &gt; Fetching via ssh://<a href=3D"mailto:git@gitlab.freedesktop.org" =
target=3D"_blank">git@gitlab.freedesktop.org</a> is giving me Permission de=
nied<br>
&gt; &gt; (publickey,keyboard-interactive).=C2=A0 I&#39;m not sure if the l=
atter is an infra<br>
&gt; &gt; issue or if the ssh key I have stored in my gitlab account are ou=
t of date<br>
&gt; &gt; (it&#39;s been about a year since I touched this).=C2=A0 Unfortun=
ately, I can&#39;t seem<br>
&gt; &gt; to access <a href=3D"https://gitlab.freedesktop.org" rel=3D"noref=
errer" target=3D"_blank">https://gitlab.freedesktop.org</a> to check as it&=
#39;s constantly<br>
&gt; &gt; presenting me a 504 Gateway timeout.<br>
&gt; &gt;<br>
&gt; &gt; Is anyone else able to pull sources via ssh://<a href=3D"mailto:g=
it@gitlab.freedesktop.org" target=3D"_blank">git@gitlab.freedesktop.org</a>=
<br>
&gt; &gt; right now?=C2=A0 Is someone looking into the 504 issue?<br>
&gt;<br>
&gt; not an fdo admin but judging by the chatter on #freedesktop: no and ye=
s, in<br>
&gt; that order. seems like the infrastructure is in various stages of depo=
siting<br>
&gt; fecal matter on itself and the fixes are involved enough that the admi=
ns have<br>
&gt; to be mentally awake, not merely physically.<br>
<br>
Yes, that&#39;s what&#39;s happening. Our (multi-host-replicated etc) Ceph<=
br>
storage setup has entered a degraded mode due to the loss of a couple<br>
of disks - no data has been lost but the cluster is currently unhappy.<br>
We&#39;re walking through fixing this, but have bumped into some other<br>
issues since, including a newly-flaky network setup, and changes since<br>
we last provisioned a new storage host.<br>
<br>
We&#39;re working through them one by one and will have the service back<br=
>
up with all our data intact - hopefully in a matter of hours but we<br>
have no firm ETA right now.<br>
<br>
Cheers,<br>
Daniel<br>
</blockquote></div>

--000000000000c089a205e14f72e9--
