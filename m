Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB1E7D992B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 15:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF6D10E9A5;
	Fri, 27 Oct 2023 13:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0096110E9A4;
 Fri, 27 Oct 2023 13:00:07 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 76B9D32F2F6;
 Fri, 27 Oct 2023 14:00:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1698411606; bh=zHlNhs1vxZXbmTASx+TEkuUgkdoX7K1dRg8FPCoT8t4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hp/ZA4JdlrNhY7j1VEfLpNgIX3Wm5A+XoBmA+bvtSwTabdWUKM1Tmn7C0dCvM5WHu
 2PLho0FxjNXHYXHaA2aaU6n3V/IoCm3HjdEPbUQlG34YuUXHAfycF1VisB+F9E7yKY
 PCr1EGf2zaTgq7vf7D8auhjURXx8cpIEO6RiOdzBa6ZUkvj8ImeqH73ofFStFMjnJB
 +x5GcoTO1N8nCb4woaevQNoeBWg0nptCP3RzH8AgeBYTqDwmYQZApSJqGzMDYoVa+8
 6Y8a0atWQYN4qahx0b15+zlYfaCgR9kpS3w2DWZC+hY48kKjD05tVlyjgtOiEepdBx
 lVliQaMLBWBwg==
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-9adca291f99so301504966b.2; 
 Fri, 27 Oct 2023 06:00:06 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz61oQZYEJUNx52NiXbdCMJfEHDhPVof9XnQ8EPy6glqdGErapd
 XJCl243GruY5XwYBY6xKK906DKuRab0Ny6YaBVQ=
X-Google-Smtp-Source: AGHT+IESfuEzMp/hxNM6HBpWyLRY8gWlhNCGI1F3ZeCh7Q5L7AKtapfmRtfrx8NLmEht28u+lcQTehUuTL+q0GG/ueU=
X-Received: by 2002:a17:906:ef07:b0:9c6:3c94:69fa with SMTP id
 f7-20020a170906ef0700b009c63c9469famr1787002ejs.44.1698411605873; Fri, 27 Oct
 2023 06:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox> <20231020175703.09cd2578@eldfell>
 <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
 <20231023111219.6e287958@eldfell>
 <bf69b740-dce7-94f1-293d-a4b274b52f55@nvidia.com>
 <20231026115747.44cbddad@eldfell> <20231026173003.GA319477@toolbox>
 <1255ad3-e22b-063-ffb8-18ea852f054@nvidia.com>
 <34be9d0b-18d7-7568-cf30-b3b1b9f77045@mailbox.org>
 <20231027100132.GA435169@toolbox> <20231027150103.48bf5bdc@eldfell>
In-Reply-To: <20231027150103.48bf5bdc@eldfell>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Fri, 27 Oct 2023 14:59:54 +0200
X-Gmail-Original-Message-ID: <CAFZQkGxJA4OYwChwkN4i-CejOt5tzUQbBQXAJu_0BO3XP7VL8Q@mail.gmail.com>
Message-ID: <CAFZQkGxJA4OYwChwkN4i-CejOt5tzUQbBQXAJu_0BO3XP7VL8Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
To: Pekka Paalanen <ppaalanen@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000736f6a0608b2444a"
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Sasha McIntosh <sashamcintosh@google.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Shashank Sharma <shashank.sharma@amd.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Victoria Brekenfeld <victoria@system76.com>, dri-devel@lists.freedesktop.org,
 Christopher Braga <quic_cbraga@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Joshua Ashton <joshua@froggi.es>,
 Aleix Pol <aleixpol@kde.org>, Hector Martin <marcan@marcan.st>,
 wayland-devel@lists.freedesktop.org, Arthur Grillo <arthurgrillo@riseup.net>,
 Naseer Ahmed <quic_naseer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000736f6a0608b2444a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm afraid that would not be very useful. It indeed depends on the refresh
rate, but also on how close to vblank the compositor does its commits / on
what the latency requirements for the currently shown content are.
When the compositor presents a fullscreen video with frames that are queued
up in advance, needing a full frame to program the atomic commit could be
acceptable, but when the user moves the cursor or plays a game, the
compositor needs to do the commits as close to vblank as possible. Without
a known upper bound on the time that it takes to program the hardware
that's not doable.

Am Fr., 27. Okt. 2023 um 14:01 Uhr schrieb Pekka Paalanen <
ppaalanen@gmail.com>:

> On Fri, 27 Oct 2023 12:01:32 +0200
> Sebastian Wick <sebastian.wick@redhat.com> wrote:
>
> > On Fri, Oct 27, 2023 at 10:59:25AM +0200, Michel D=C3=A4nzer wrote:
> > > On 10/26/23 21:25, Alex Goins wrote:
> > > > On Thu, 26 Oct 2023, Sebastian Wick wrote:
> > > >> On Thu, Oct 26, 2023 at 11:57:47AM +0300, Pekka Paalanen wrote:
> > > >>> On Wed, 25 Oct 2023 15:16:08 -0500 (CDT)
> > > >>> Alex Goins <agoins@nvidia.com> wrote:
> > > >>>
> > > >>>> Despite being programmable, the LUTs are updated in a manner tha=
t
> is less
> > > >>>> efficient as compared to e.g. the non-static "degamma" LUT. Woul=
d
> it be helpful
> > > >>>> if there was some way to tag operations according to their
> performance,
> > > >>>> for example so that clients can prefer a high performance one
> when they
> > > >>>> intend to do an animated transition? I recall from the XDC HDR
> workshop
> > > >>>> that this is also an issue with AMD's 3DLUT, where updates can b=
e
> too
> > > >>>> slow to animate.
> > > >>>
> > > >>> I can certainly see such information being useful, but then we
> need to
> > > >>> somehow quantize the performance.
> > > >
> > > > Right, which wouldn't even necessarily be universal, could depend o=
n
> the given
> > > > host, GPU, etc. It could just be a relative performance indication,
> to give an
> > > > order of preference. That wouldn't tell you if it can or can't be
> animated, but
> > > > when choosing between two LUTs to animate you could prefer the high=
er
> > > > performance one.
> > > >
> > > >>>
> > > >>> What I was left puzzled about after the XDC workshop is that is i=
t
> > > >>> possible to pre-load configurations in the background (slow), and
> then
> > > >>> quickly switch between them? Hardware-wise I mean.
> > > >
> > > > This works fine for our "fast" LUTs, you just point them to a
> surface in video
> > > > memory and they flip to it. You could keep multiple surfaces around
> and flip
> > > > between them without having to reprogram them in software. We can
> easily do that
> > > > with enumerated curves, populating them when the driver initializes
> instead of
> > > > waiting for the client to request them. You can even point multiple
> hardware
> > > > LUTs to the same video memory surface, if they need the same curve.
> > > >
> > > >>
> > > >> We could define that pipelines with a lower ID are to be preferred
> over
> > > >> higher IDs.
> > > >
> > > > Sure, but this isn't just an issue with a pipeline as a whole, but
> the
> > > > individual elements within it and how to use them in a given contex=
t.
> > > >
> > > >>
> > > >> The issue is that if programming a pipeline becomes too slow to be
> > > >> useful it probably should just not be made available to user
> space.
> > > >
> > > > It's not that programming the pipeline is overall too slow. The LUT=
s
> we have
> > > > that are relatively slow to program are meant to be set
> infrequently, or even
> > > > just once, to allow the scaler and tone mapping operator to operate
> in fixed
> > > > point PQ space. You might still want the tone mapper, so you would
> choose a
> > > > pipeline that includes them, but when it comes to e.g. animating a
> night light,
> > > > you would want to choose a different LUT for that purpose.
> > > >
> > > >>
> > > >> The prepare-commit idea for blob properties would help to make the
> > > >> pipelines usable again, but until then it's probably a good idea t=
o
> just
> > > >> not expose those pipelines.
> > > >
> > > > The prepare-commit idea actually wouldn't work for these LUTs,
> because they are
> > > > programmed using methods instead of pointing them to a surface. I'm
> actually not
> > > > sure how slow it actually is, would need to benchmark it. I think
> not exposing
> > > > them at all would be overkill, since it would mean you can't use th=
e
> preblending
> > > > scaler or tonemapper, and animation isn't necessary for that.
> > > >
> > > > The AMD 3DLUT is another example of a LUT that is slow to update,
> and it would
> > > > obviously be a major loss if that wasn't exposed. There just needs
> to be some
> > > > way for clients to know if they are going to kill performance by
> trying to
> > > > change it every frame.
> > >
> > > Might a first step be to require the ALLOW_MODESET flag to be set whe=
n
> changing the values for a colorop which is too slow to be updated per
> refresh cycle?
> > >
> > > This would tell the compositor: You can use this colorop, but you
> can't change its values on the fly.
> >
> > I argued before that changing any color op to passthrough should never
> > require ALLOW_MODESET and while this is really hard to guarantee from a
> > driver perspective I still believe that it's better to not expose any
> > feature requiring ALLOW_MODESET or taking too long to program to be
> > useful for per-frame changes.
> >
> > When user space has ways to figure out if going back to a specific stat=
e
> > (in this case setting everything to bypass) without ALLOW_MODESET we ca=
n
> > revisit this decision, but until then, let's keep things simple and onl=
y
> > expose things that work reliably without ALLOW_MODESET and fast enough
> > to work for per-frame changes.
> >
> > Harry, Pekka: Should we document this? It obviously restricts what can
> > be exposed but exposing things that can't be used by user space isn't
> > useful.
>
> In an ideal world... but in real world, I don't know.
>
> Would it help if there was a list collected, with all the things in
> various hardware that is known to be too heavy to reprogram every
> refresh? Maybe that would allow a more educated decision?
>
> I bet that depends also on the refresh rate.
>
> I would probably be fine with some sort of update cost classification
> on colorops, and the kernel keeping track of blobs: if userspace sets
> the same blob on the same colorop that is already there (by blob ID, no
> need to compare contents), then it's a no-op change.
>
>
> Anyway, I really like reading Alex Goins' reply, it seems we are very
> much on the same page here. :-)
>
>
> Thanks,
> pq
>

--000000000000736f6a0608b2444a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m afraid that would not be very useful. It inde=
ed depends on the=20
refresh rate, but also on how close to vblank the compositor does its=20
commits / on what the latency requirements for the currently shown=20
content are.</div><div>When the compositor presents a fullscreen video=20
with frames that are queued up in advance, needing a full frame to=20
program the atomic commit could be acceptable, but when the user moves=20
the cursor or plays a game, the compositor needs to do the commits as=20
close to vblank as possible. Without a known upper bound on the time=20
that it takes to program the hardware that&#39;s not doable.</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Am Fr., 2=
7. Okt. 2023 um 14:01=C2=A0Uhr schrieb Pekka Paalanen &lt;<a href=3D"mailto=
:ppaalanen@gmail.com">ppaalanen@gmail.com</a>&gt;:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Fri, 27 Oct 2023 12:01:32 +0200<br>
Sebastian Wick &lt;<a href=3D"mailto:sebastian.wick@redhat.com" target=3D"_=
blank">sebastian.wick@redhat.com</a>&gt; wrote:<br>
<br>
&gt; On Fri, Oct 27, 2023 at 10:59:25AM +0200, Michel D=C3=A4nzer wrote:<br=
>
&gt; &gt; On 10/26/23 21:25, Alex Goins wrote:=C2=A0 <br>
&gt; &gt; &gt; On Thu, 26 Oct 2023, Sebastian Wick wrote:=C2=A0 <br>
&gt; &gt; &gt;&gt; On Thu, Oct 26, 2023 at 11:57:47AM +0300, Pekka Paalanen=
 wrote:=C2=A0 <br>
&gt; &gt; &gt;&gt;&gt; On Wed, 25 Oct 2023 15:16:08 -0500 (CDT)<br>
&gt; &gt; &gt;&gt;&gt; Alex Goins &lt;<a href=3D"mailto:agoins@nvidia.com" =
target=3D"_blank">agoins@nvidia.com</a>&gt; wrote:<br>
&gt; &gt; &gt;&gt;&gt;=C2=A0 <br>
&gt; &gt; &gt;&gt;&gt;&gt; Despite being programmable, the LUTs are updated=
 in a manner that is less<br>
&gt; &gt; &gt;&gt;&gt;&gt; efficient as compared to e.g. the non-static &qu=
ot;degamma&quot; LUT. Would it be helpful<br>
&gt; &gt; &gt;&gt;&gt;&gt; if there was some way to tag operations accordin=
g to their performance,<br>
&gt; &gt; &gt;&gt;&gt;&gt; for example so that clients can prefer a high pe=
rformance one when they<br>
&gt; &gt; &gt;&gt;&gt;&gt; intend to do an animated transition? I recall fr=
om the XDC HDR workshop<br>
&gt; &gt; &gt;&gt;&gt;&gt; that this is also an issue with AMD&#39;s 3DLUT,=
 where updates can be too<br>
&gt; &gt; &gt;&gt;&gt;&gt; slow to animate.=C2=A0 <br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; I can certainly see such information being useful, b=
ut then we need to<br>
&gt; &gt; &gt;&gt;&gt; somehow quantize the performance.=C2=A0 <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Right, which wouldn&#39;t even necessarily be universal, cou=
ld depend on the given<br>
&gt; &gt; &gt; host, GPU, etc. It could just be a relative performance indi=
cation, to give an<br>
&gt; &gt; &gt; order of preference. That wouldn&#39;t tell you if it can or=
 can&#39;t be animated, but<br>
&gt; &gt; &gt; when choosing between two LUTs to animate you could prefer t=
he higher<br>
&gt; &gt; &gt; performance one.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; What I was left puzzled about after the XDC workshop=
 is that is it<br>
&gt; &gt; &gt;&gt;&gt; possible to pre-load configurations in the backgroun=
d (slow), and then<br>
&gt; &gt; &gt;&gt;&gt; quickly switch between them? Hardware-wise I mean.=
=C2=A0 <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This works fine for our &quot;fast&quot; LUTs, you just poin=
t them to a surface in video<br>
&gt; &gt; &gt; memory and they flip to it. You could keep multiple surfaces=
 around and flip<br>
&gt; &gt; &gt; between them without having to reprogram them in software. W=
e can easily do that<br>
&gt; &gt; &gt; with enumerated curves, populating them when the driver init=
ializes instead of<br>
&gt; &gt; &gt; waiting for the client to request them. You can even point m=
ultiple hardware<br>
&gt; &gt; &gt; LUTs to the same video memory surface, if they need the same=
 curve.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; We could define that pipelines with a lower ID are to be=
 preferred over<br>
&gt; &gt; &gt;&gt; higher IDs.=C2=A0 <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Sure, but this isn&#39;t just an issue with a pipeline as a =
whole, but the<br>
&gt; &gt; &gt; individual elements within it and how to use them in a given=
 context.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; The issue is that if programming a pipeline becomes too =
slow to be<br>
&gt; &gt; &gt;&gt; useful it probably should just not be made available to =
user space.=C2=A0 <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; It&#39;s not that programming the pipeline is overall too sl=
ow. The LUTs we have<br>
&gt; &gt; &gt; that are relatively slow to program are meant to be set infr=
equently, or even<br>
&gt; &gt; &gt; just once, to allow the scaler and tone mapping operator to =
operate in fixed<br>
&gt; &gt; &gt; point PQ space. You might still want the tone mapper, so you=
 would choose a<br>
&gt; &gt; &gt; pipeline that includes them, but when it comes to e.g. anima=
ting a night light,<br>
&gt; &gt; &gt; you would want to choose a different LUT for that purpose.<b=
r>
&gt; &gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; The prepare-commit idea for blob properties would help t=
o make the<br>
&gt; &gt; &gt;&gt; pipelines usable again, but until then it&#39;s probably=
 a good idea to just<br>
&gt; &gt; &gt;&gt; not expose those pipelines.=C2=A0 <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The prepare-commit idea actually wouldn&#39;t work for these=
 LUTs, because they are<br>
&gt; &gt; &gt; programmed using methods instead of pointing them to a surfa=
ce. I&#39;m actually not<br>
&gt; &gt; &gt; sure how slow it actually is, would need to benchmark it. I =
think not exposing<br>
&gt; &gt; &gt; them at all would be overkill, since it would mean you can&#=
39;t use the preblending<br>
&gt; &gt; &gt; scaler or tonemapper, and animation isn&#39;t necessary for =
that.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The AMD 3DLUT is another example of a LUT that is slow to up=
date, and it would<br>
&gt; &gt; &gt; obviously be a major loss if that wasn&#39;t exposed. There =
just needs to be some<br>
&gt; &gt; &gt; way for clients to know if they are going to kill performanc=
e by trying to<br>
&gt; &gt; &gt; change it every frame.=C2=A0 <br>
&gt; &gt; <br>
&gt; &gt; Might a first step be to require the ALLOW_MODESET flag to be set=
 when changing the values for a colorop which is too slow to be updated per=
 refresh cycle?<br>
&gt; &gt; <br>
&gt; &gt; This would tell the compositor: You can use this colorop, but you=
 can&#39;t change its values on the fly.=C2=A0 <br>
&gt; <br>
&gt; I argued before that changing any color op to passthrough should never=
<br>
&gt; require ALLOW_MODESET and while this is really hard to guarantee from =
a<br>
&gt; driver perspective I still believe that it&#39;s better to not expose =
any<br>
&gt; feature requiring ALLOW_MODESET or taking too long to program to be<br=
>
&gt; useful for per-frame changes.<br>
&gt; <br>
&gt; When user space has ways to figure out if going back to a specific sta=
te<br>
&gt; (in this case setting everything to bypass) without ALLOW_MODESET we c=
an<br>
&gt; revisit this decision, but until then, let&#39;s keep things simple an=
d only<br>
&gt; expose things that work reliably without ALLOW_MODESET and fast enough=
<br>
&gt; to work for per-frame changes.<br>
&gt; <br>
&gt; Harry, Pekka: Should we document this? It obviously restricts what can=
<br>
&gt; be exposed but exposing things that can&#39;t be used by user space is=
n&#39;t<br>
&gt; useful.<br>
<br>
In an ideal world... but in real world, I don&#39;t know.<br>
<br>
Would it help if there was a list collected, with all the things in<br>
various hardware that is known to be too heavy to reprogram every<br>
refresh? Maybe that would allow a more educated decision?<br>
<br>
I bet that depends also on the refresh rate.<br>
<br>
I would probably be fine with some sort of update cost classification<br>
on colorops, and the kernel keeping track of blobs: if userspace sets<br>
the same blob on the same colorop that is already there (by blob ID, no<br>
need to compare contents), then it&#39;s a no-op change.<br>
<br>
<br>
Anyway, I really like reading Alex Goins&#39; reply, it seems we are very<b=
r>
much on the same page here. :-)<br>
<br>
<br>
Thanks,<br>
pq<br>
</blockquote></div>

--000000000000736f6a0608b2444a--
