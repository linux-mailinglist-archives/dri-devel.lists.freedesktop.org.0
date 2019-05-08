Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F56617B9E
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 16:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC36F89700;
	Wed,  8 May 2019 14:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7726489700
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 14:37:28 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id n134so12891681lfn.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 07:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=Jwi+XiDBBZYpEW0bFiznktLRMdbckfIl/3oolZSvdlk=;
 b=JOOyyboWqTW90h0A0acWBXf/zVY7AK3bG/s7lPizLkriLZjr6XBPY6W0enHd0HSHgZ
 IsPsAo0felX1dgltu2rOEqdexe8CZZsUmjH4rBZNXlMm83kDpSs0ZBysPPzVQJCQ9yTT
 ku4TtdrgfI9Fi6U4Dm/yuNhSXFb2kSdqK24YDPiGTKfJVLnWYoP8h9dU9jgoxpyoOBzb
 XN+Iq0lPfcAZbLrk9KhHPAnciJm+QcpqGeJSB5Tkm1OgmoI74P5rSWj/J7Ljz6IfkGeR
 vjaZ4zgPX8fxopbz4yGD1+yoebLoYlErEd6MDFtIK+bnlSQ/VHyHTiNf78sSosYuQUle
 bV+g==
X-Gm-Message-State: APjAAAWL50XgByXXw3e2Mj5OoyCA/2oGQ8XjgQJPo8EGKFsMaxUt17p7
 sbtqupddhmsBAH3O8iP2kv/qbHVRdO3AzQDdd4U=
X-Received: by 2002:a19:550d:: with SMTP id n13mt14856607lfe.127.1557326246693; 
 Wed, 08 May 2019 07:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <a473bcae-113f-a347-9afd-d69d7176c264@amd.com>
In-Reply-To: <a473bcae-113f-a347-9afd-d69d7176c264@amd.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 8 May 2019 10:37:15 -0400
Message-ID: <CAHUNapQnhBXWt5QWKMZ1wZg+OCPR_7apZhxyffCp9=TtFfe6_A@mail.gmail.com>
Subject: Re: 2019 Xorg Election Results
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=Jwi+XiDBBZYpEW0bFiznktLRMdbckfIl/3oolZSvdlk=;
 b=d2mvAwkbUFFbfrEBKRfLA12sYU0f6IW+A0NkYMN+qtlrIV9ZXYr6OtYJuU5NKrSogX
 eUdqYTKuhN1rsYPxoAFNjMp7eB5a9Kojez/1PEOstpaFVSDLuct7sFJGcl5wuqc93/Ra
 FE7IPZAiwFc1FXbZOjuUgb6JwAqdgz7cxJveTkpQb8f0pids/9EdKrV3L2bJh0AonUvo
 fjDUjDMUrxv+cNN93OQ1qCAkhQ5Zs6Vt+oMZByFrlJ8SxRbOibqAUK2LmvXnozB3tGnX
 ZLygpXhi16j2VZbab3xUKYQgOaZpEEUnhiF1VL7oLBzwIPF2b3S9rK+JYWQeD3iGIfV2
 IHaQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>,
 "xorg@lists.x.org" <xorg@lists.x.org>, xorg-devel <xorg-devel@lists.x.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0253165590=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0253165590==
Content-Type: multipart/alternative; boundary="000000000000bdbfe905886145bd"

--000000000000bdbfe905886145bd
Content-Type: text/plain; charset="UTF-8"

On Wed, May 8, 2019 at 10:06 AM Harry Wentland <hwentlan@amd.com> wrote:

>    Trevor Woerner             4  14  10  10   8  19   199
>

I'd like to truly thank the other 3 people who chose me as their 1st pick,
and the 14 (:-O !!) who chose me as their first 2nd-place pick!
Considering I'm not an active contributor of code to this project, I think
this is an amazing result! Thank you :-D

Although I didn't make it on the board, I remain committed to running GSoC
and EVoC.

--000000000000bdbfe905886145bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, May 8, 2019 at 10:06 AM Harry Wentland &lt;<a href=
=3D"mailto:hwentlan@amd.com">hwentlan@amd.com</a>&gt; wrote:<br><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0=
=C2=A0 Trevor Woerner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04=C2=
=A0 14=C2=A0 10=C2=A0 10=C2=A0 =C2=A08=C2=A0 19=C2=A0 =C2=A0199<br>
</blockquote><div><br></div><div>I&#39;d like to truly thank the other 3 pe=
ople who chose me as their 1st pick, and the 14 (:-O !!) who chose me as th=
eir first 2nd-place pick!</div><div>Considering I&#39;m not an active contr=
ibutor of code to this project, I think this is an amazing result! Thank yo=
u :-D<br></div><div><br></div><div>Although I didn&#39;t make it on the boa=
rd, I remain committed to running GSoC and EVoC.<br></div></div></div>

--000000000000bdbfe905886145bd--

--===============0253165590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0253165590==--
