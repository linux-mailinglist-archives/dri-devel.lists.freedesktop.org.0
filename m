Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 265C9382BD8
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 14:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C392F6E935;
	Mon, 17 May 2021 12:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12D86E935
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 12:11:22 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id e190so8171845ybb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 05:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1cvkhvttsmdbTMrkHgFYTDmb35Dllnu+S5fMN8qfqFQ=;
 b=lv5UEe/mqNl0g8VM/4RXqGC21+SS6ExkuARIHXKMOuc9/H7sfm6HrRlWJIHDX0iCF0
 niw3oHWW0zMjgzsShJLi+Te8KvO8+mL1SlSvk7Ynw+fSRHq+tk9gbQoPIDgBnBjhN1zU
 zWZyY++zukVluskT4NbLE/hSoooDbbEIJIKS93364AVlcJb3Pc38ylCUgq50sATvNl4Z
 irO7MlI/+Zd1YZV14fkfF1Nzs756ANomk2LHUbHAHlHnXmdesJbkn2BZgLbKJKri3IMy
 jKZtX9zFtPH7ASWnWJlpjw5cnFIp7UAOrlGdwbZE7/zimNzwHSuaO/pLprsIcmkXbjeF
 nJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1cvkhvttsmdbTMrkHgFYTDmb35Dllnu+S5fMN8qfqFQ=;
 b=DqSBOCCi8Kv+fRThEGhQU4XsfaGCAHxqugYM4Z1OYklm/3CY1wybyDr/VRBLzCJr3a
 nSTqkLyARg1Vh7Quz1VnpN73PkfJv5kMiFLnFm3YxngEwhQPxqQ5yUZEE2gY5pLHznLH
 Iiyrf4LiarkzqDxCMA5DmbMD0v3qpDI581YkdpKjKNy9x7u7DrMDZTUA7he05rIoOpEH
 m0Oi1fV/B+eNrbbh0QrOrneEY996KNcdk2TT46bbfV4hLP5whPqtBu+58o8554ziEHQL
 WFgow6Mt2v4gRwfiuPeKo0HxfTvoVHPbNWa+nEJkUcGZRoAYMM6g555fR2+RLsA2Ebuh
 sUdA==
X-Gm-Message-State: AOAM530k2ANQPyJZT1Fxzmiv6sRhFcsImxUolZb6UXus+ITBTQcexll+
 UYReHLe/Y6esABaq1C4VV3ygWOi2Q+CWehY3xUV+IkPFLWQ=
X-Google-Smtp-Source: ABdhPJzd52C8BQUx2ycTIQkrr8q5U+PF6cESxGGtyurLIx1S6ysxKBJnCvTeILcpFVh4qvpgQpDtkIusgFxW8sLTSQc=
X-Received: by 2002:a25:d690:: with SMTP id
 n138mr76366648ybg.310.1621253481827; 
 Mon, 17 May 2021 05:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210517115922.8033-1-drawat.floss@gmail.com>
 <20210517115922.8033-3-drawat.floss@gmail.com>
In-Reply-To: <20210517115922.8033-3-drawat.floss@gmail.com>
From: Deepak Rawat <drawat.floss@gmail.com>
Date: Mon, 17 May 2021 05:11:14 -0700
Message-ID: <CAHFnvW2d=Z0gbnYTsjb9Vhtn3Am1D1zV4TteDGYuTfpYHQa+hw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] MAINTAINERS: Add maintainer for hyperv video device
To: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000e0130605c2857d4a"
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
Cc: Dexuan Cui <decui@microsoft.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Kelley <mikelley@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000e0130605c2857d4a
Content-Type: text/plain; charset="UTF-8"

Sorry messed this patch during rebase. Will send this one again after
fixing this.

On Mon, May 17, 2021 at 4:59 AM Deepak Rawat <drawat.floss@gmail.com> wrote:

> Maintainer for hyperv synthetic video device.
>
> Signed-off-by: Deepak Rawat <drawat.floss@gmail.com>
> ---
>  MAINTAINERS | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd7aff0c120f..261342551406 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6077,6 +6077,14 @@ T:       git git://
> anongit.freedesktop.org/drm/drm-misc
>  F:     Documentation/devicetree/bindings/display/hisilicon/
>  F:     drivers/gpu/drm/hisilicon/
>
> +DRM DRIVER FOR HYPERV SYNTHETIC VIDEO DEVICE
> +M:     Deepak Rawat <drawat.floss@gmail.com>
> +L:     linux-hyperv@vger.kernel.org
> +L:     dri-devel@lists.freedesktop.org
> +S:     Maintained
> +T:     git git://anongit.freedesktop.org/drm/drm-misc
> +F:     drivers/gpu/drm/hyperv
> +
>  DRM DRIVERS FOR LIMA
>  M:     Qiang Yu <yuq825@gmail.com>
>  L:     dri-devel@lists.freedesktop.org
> @@ -6223,6 +6231,14 @@ T:       git git://
> anongit.freedesktop.org/drm/drm-misc
>  F:     Documentation/devicetree/bindings/display/xlnx/
>  F:     drivers/gpu/drm/xlnx/
>
> +DRM DRIVERS FOR ZTE ZX
> +M:     Shawn Guo <shawnguo@kernel.org>
> +L:     dri-devel@lists.freedesktop.org
> +S:     Maintained
> +T:     git git://anongit.freedesktop.org/drm/drm-misc
> +F:     Documentation/devicetree/bindings/display/zte,vou.txt
> +F:     drivers/gpu/drm/zte/
> +
>  DRM PANEL DRIVERS
>  M:     Thierry Reding <thierry.reding@gmail.com>
>  R:     Sam Ravnborg <sam@ravnborg.org>
> --
> 2.31.1
>
>

--000000000000e0130605c2857d4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry messed this patch during rebase. Will send this one =
again after fixing this.</div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, May 17, 2021 at 4:59 AM Deepak Rawat &lt;<a=
 href=3D"mailto:drawat.floss@gmail.com">drawat.floss@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Maintainer fo=
r hyperv synthetic video device.<br>
<br>
Signed-off-by: Deepak Rawat &lt;<a href=3D"mailto:drawat.floss@gmail.com" t=
arget=3D"_blank">drawat.floss@gmail.com</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS | 16 ++++++++++++++++<br>
=C2=A01 file changed, 16 insertions(+)<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index bd7aff0c120f..261342551406 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -6077,6 +6077,14 @@ T:=C2=A0 =C2=A0 =C2=A0 =C2=A0git git://<a href=3D"ht=
tp://anongit.freedesktop.org/drm/drm-misc" rel=3D"noreferrer" target=3D"_bl=
ank">anongit.freedesktop.org/drm/drm-misc</a><br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0Documentation/devicetree/bindings/display/hisil=
icon/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/hisilicon/<br>
<br>
+DRM DRIVER FOR HYPERV SYNTHETIC VIDEO DEVICE<br>
+M:=C2=A0 =C2=A0 =C2=A0Deepak Rawat &lt;<a href=3D"mailto:drawat.floss@gmai=
l.com" target=3D"_blank">drawat.floss@gmail.com</a>&gt;<br>
+L:=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:linux-hyperv@vger.kernel.org" targ=
et=3D"_blank">linux-hyperv@vger.kernel.org</a><br>
+L:=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:dri-devel@lists.freedesktop.org" t=
arget=3D"_blank">dri-devel@lists.freedesktop.org</a><br>
+S:=C2=A0 =C2=A0 =C2=A0Maintained<br>
+T:=C2=A0 =C2=A0 =C2=A0git git://<a href=3D"http://anongit.freedesktop.org/=
drm/drm-misc" rel=3D"noreferrer" target=3D"_blank">anongit.freedesktop.org/=
drm/drm-misc</a><br>
+F:=C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/hyperv<br>
+<br>
=C2=A0DRM DRIVERS FOR LIMA<br>
=C2=A0M:=C2=A0 =C2=A0 =C2=A0Qiang Yu &lt;<a href=3D"mailto:yuq825@gmail.com=
" target=3D"_blank">yuq825@gmail.com</a>&gt;<br>
=C2=A0L:=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:dri-devel@lists.freedesktop.o=
rg" target=3D"_blank">dri-devel@lists.freedesktop.org</a><br>
@@ -6223,6 +6231,14 @@ T:=C2=A0 =C2=A0 =C2=A0 =C2=A0git git://<a href=3D"ht=
tp://anongit.freedesktop.org/drm/drm-misc" rel=3D"noreferrer" target=3D"_bl=
ank">anongit.freedesktop.org/drm/drm-misc</a><br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0Documentation/devicetree/bindings/display/xlnx/=
<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/xlnx/<br>
<br>
+DRM DRIVERS FOR ZTE ZX<br>
+M:=C2=A0 =C2=A0 =C2=A0Shawn Guo &lt;<a href=3D"mailto:shawnguo@kernel.org"=
 target=3D"_blank">shawnguo@kernel.org</a>&gt;<br>
+L:=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:dri-devel@lists.freedesktop.org" t=
arget=3D"_blank">dri-devel@lists.freedesktop.org</a><br>
+S:=C2=A0 =C2=A0 =C2=A0Maintained<br>
+T:=C2=A0 =C2=A0 =C2=A0git git://<a href=3D"http://anongit.freedesktop.org/=
drm/drm-misc" rel=3D"noreferrer" target=3D"_blank">anongit.freedesktop.org/=
drm/drm-misc</a><br>
+F:=C2=A0 =C2=A0 =C2=A0Documentation/devicetree/bindings/display/zte,vou.tx=
t<br>
+F:=C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/zte/<br>
+<br>
=C2=A0DRM PANEL DRIVERS<br>
=C2=A0M:=C2=A0 =C2=A0 =C2=A0Thierry Reding &lt;<a href=3D"mailto:thierry.re=
ding@gmail.com" target=3D"_blank">thierry.reding@gmail.com</a>&gt;<br>
=C2=A0R:=C2=A0 =C2=A0 =C2=A0Sam Ravnborg &lt;<a href=3D"mailto:sam@ravnborg=
.org" target=3D"_blank">sam@ravnborg.org</a>&gt;<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div>

--000000000000e0130605c2857d4a--
