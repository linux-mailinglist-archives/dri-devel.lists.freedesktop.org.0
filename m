Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A337B167BC9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F6B6F409;
	Fri, 21 Feb 2020 11:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9036E055
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 00:58:12 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a5so2421wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 16:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ExcozN6xdr5UUe3LCytIaOL50SCUP8YZrYwwWNdnInQ=;
 b=yXojH86NMHLSuFHC9enQYcEYYER/Os/7/lnwmBUvzHBihcnBwWET0/aTfKoGHVqhRr
 WlPLvTmkwsaEZ3azqYvuXSCeh4NwBXZOi4QFawZolbX/bjkRgFCmTMhBAkuoQ0bbKcXh
 Y0nftxk88P4Q66SappQhZI/dLEOH/pPk7cwfoXPyPrV218pSjBoUUb2xf/w9+todWJ2F
 nZskyDg8WnMB4+e9/unnEzvTG9ibP9DH3lmJpXJRX6cVcC8quJ4vvgnCzIXJBHl3mHi9
 dIbWIQXDApU4vjr6Iq9qdC4B3aLylefR563MUGrS4Jx3i2WeRHn0nR6buWUvSRVAtUp0
 /QiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ExcozN6xdr5UUe3LCytIaOL50SCUP8YZrYwwWNdnInQ=;
 b=pO+0zc15R6W51KTPp5mntuIxCr31S6XzmfAfBXngJ8IixeFY0CsUR7ha1lg7Yw5A6J
 s655Jy65f/YYafOz4NrG/ats/0LQu8rQB8bUhlMqUGdIjVqZlAGtdJDZx7d9mE41cWHN
 QjAEoeLmcsZH5MXjxsTrf5fPmYvDT86klja+IM/WEF1wY6n+oDxg4BXEh+XasGqZ+BEr
 ROxjNmw0LQFoKJgKYaAr1djdJisPVnjTqvNFkPd/MOaoAvDUmgyQ/yeoEyRLj8SvJ04c
 UrzT5vpovT07dWQdWKWnmIWzv5JLQXpezAWgQ9H3+QgtBN3IYm/JZ5/8JBfjs5AaCyNL
 YXww==
X-Gm-Message-State: APjAAAXSwBybSOoAWhFJS/20RcRY6Q5u4jed1XumFBw7F5puwmpKBn/7
 r/7V1+pCuzoFCCXIEQ68yZOCoiN8DHtu9C4E4jZeyw==
X-Google-Smtp-Source: APXvYqzN7GWyY/g8bre2KiUrvt61sTbI7U3aQKIXxm4mngP6ODoYVnkmz2n/IT3bfnpRtJxNKyhYwuTulPyjjg0GH+4=
X-Received: by 2002:a05:600c:294:: with SMTP id
 20mr7502449wmk.135.1582246691472; 
 Thu, 20 Feb 2020 16:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20200220090328.25932-1-xinliang.liu@linaro.org>
 <20200220182141.GY2363188@phenom.ffwll.local>
 <20200220182234.GZ2363188@phenom.ffwll.local>
In-Reply-To: <20200220182234.GZ2363188@phenom.ffwll.local>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Fri, 21 Feb 2020 08:58:00 +0800
Message-ID: <CAKoKPbxWK1zzm21X0uJ1-L0n0Yz8bTtwSMDf0WxYBQR8O4uwPQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update myself email address
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:23 +0000
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1853561002=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1853561002==
Content-Type: multipart/alternative; boundary="000000000000fe1e7a059f0b83c4"

--000000000000fe1e7a059f0b83c4
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2020 at 02:22, Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Feb 20, 2020 at 07:21:41PM +0100, Daniel Vetter wrote:
> > On Thu, Feb 20, 2020 at 09:03:28AM +0000, Xinliang Liu wrote:
> > > Update myself email address.
> > > Add John Stultz as a reviewer. Thanks John.
> > > Update git tree to drm-misc
> >
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > I guess you're going to push this to drm-misc?
>
> Oh and I guess time for John Stultz to apply for drm-misc commit rights,
>

Sure, if John would like.
But I will push this patch into drm-misc, thanks Daniel.
-Xinliang


> seems to be lacking.
> -Daniel
> >
> > >
> > > Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
> > > ---
> > >  MAINTAINERS | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 978766c6715e..befc3c0afc75 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -5600,12 +5600,13 @@ S:  Maintained
> > >  F: drivers/gpu/drm/gma500/
> > >
> > >  DRM DRIVERS FOR HISILICON
> > > -M: Xinliang Liu <z.liuxinliang@hisilicon.com>
> > > +M: Xinliang Liu <xinliang.liu@linaro.org>
> > >  M: Rongrong Zou <zourongrong@gmail.com>
> > > +R: John Stultz <john.stultz@linaro.org>
> > >  R: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> > >  R: Chen Feng <puck.chen@hisilicon.com>
> > >  L: dri-devel@lists.freedesktop.org
> > > -T: git git://github.com/xin3liang/linux.git
> > > +T: git git://anongit.freedesktop.org/drm/drm-misc
> > >  S: Maintained
> > >  F: drivers/gpu/drm/hisilicon/
> > >  F: Documentation/devicetree/bindings/display/hisilicon/
> > > --
> > > 2.20.1
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000fe1e7a059f0b83c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 21 Feb 2020 at 02:22, Daniel =
Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Feb 20=
, 2020 at 07:21:41PM +0100, Daniel Vetter wrote:<br>
&gt; On Thu, Feb 20, 2020 at 09:03:28AM +0000, Xinliang Liu wrote:<br>
&gt; &gt; Update myself email address.<br>
&gt; &gt; Add John Stultz as a reviewer. Thanks John.<br>
&gt; &gt; Update git tree to drm-misc<br>
&gt; <br>
&gt; Acked-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" =
target=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
&gt; <br>
&gt; I guess you&#39;re going to push this to drm-misc?<br>
<br>
Oh and I guess time for John Stultz to apply for drm-misc commit rights,<br=
></blockquote><div><br></div><div>Sure, if John would like.</div><div>But I=
 will push this patch into drm-misc, thanks Daniel.</div><div>-Xinliang</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
seems to be lacking.<br>
-Daniel<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Xinliang Liu &lt;<a href=3D"mailto:xinliang.liu@li=
naro.org" target=3D"_blank">xinliang.liu@linaro.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 MAINTAINERS | 5 +++--<br>
&gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; &gt; index 978766c6715e..befc3c0afc75 100644<br>
&gt; &gt; --- a/MAINTAINERS<br>
&gt; &gt; +++ b/MAINTAINERS<br>
&gt; &gt; @@ -5600,12 +5600,13 @@ S:=C2=A0 Maintained<br>
&gt; &gt;=C2=A0 F: drivers/gpu/drm/gma500/<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 DRM DRIVERS FOR HISILICON<br>
&gt; &gt; -M: Xinliang Liu &lt;<a href=3D"mailto:z.liuxinliang@hisilicon.co=
m" target=3D"_blank">z.liuxinliang@hisilicon.com</a>&gt;<br>
&gt; &gt; +M: Xinliang Liu &lt;<a href=3D"mailto:xinliang.liu@linaro.org" t=
arget=3D"_blank">xinliang.liu@linaro.org</a>&gt;<br>
&gt; &gt;=C2=A0 M: Rongrong Zou &lt;<a href=3D"mailto:zourongrong@gmail.com=
" target=3D"_blank">zourongrong@gmail.com</a>&gt;<br>
&gt; &gt; +R: John Stultz &lt;<a href=3D"mailto:john.stultz@linaro.org" tar=
get=3D"_blank">john.stultz@linaro.org</a>&gt;<br>
&gt; &gt;=C2=A0 R: Xinwei Kong &lt;<a href=3D"mailto:kong.kongxinwei@hisili=
con.com" target=3D"_blank">kong.kongxinwei@hisilicon.com</a>&gt;<br>
&gt; &gt;=C2=A0 R: Chen Feng &lt;<a href=3D"mailto:puck.chen@hisilicon.com"=
 target=3D"_blank">puck.chen@hisilicon.com</a>&gt;<br>
&gt; &gt;=C2=A0 L: <a href=3D"mailto:dri-devel@lists.freedesktop.org" targe=
t=3D"_blank">dri-devel@lists.freedesktop.org</a><br>
&gt; &gt; -T: git git://<a href=3D"http://github.com/xin3liang/linux.git" r=
el=3D"noreferrer" target=3D"_blank">github.com/xin3liang/linux.git</a><br>
&gt; &gt; +T: git git://<a href=3D"http://anongit.freedesktop.org/drm/drm-m=
isc" rel=3D"noreferrer" target=3D"_blank">anongit.freedesktop.org/drm/drm-m=
isc</a><br>
&gt; &gt;=C2=A0 S: Maintained<br>
&gt; &gt;=C2=A0 F: drivers/gpu/drm/hisilicon/<br>
&gt; &gt;=C2=A0 F: Documentation/devicetree/bindings/display/hisilicon/<br>
&gt; &gt; -- <br>
&gt; &gt; 2.20.1<br>
&gt; &gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Daniel Vetter<br>
&gt; Software Engineer, Intel Corporation<br>
&gt; <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">=
http://blog.ffwll.ch</a><br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div></div>

--000000000000fe1e7a059f0b83c4--

--===============1853561002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1853561002==--
