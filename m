Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D724F0AA7
	for <lists+dri-devel@lfdr.de>; Sun,  3 Apr 2022 17:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0678A10E5EB;
	Sun,  3 Apr 2022 15:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF95C10E5EB
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Apr 2022 15:30:59 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id bo5so6763264pfb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Apr 2022 08:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H0TISaNkSo0AOOXgytG7SseX5lKfW1MmJ+wa2SSDqxs=;
 b=a/7p5SMefo2Q1scyajujO8xadGLaedZmVpA6SB3VKgIvnbpxQFXAW6jSydDb6JZU6Q
 VqZsKWr39BKon8QFUJEwO2Lf1B9DIt/qky9STG1ExmcAjVESLuppAnYFOwwAbBuLr+3k
 yefGHEougWzGOqRIJPsAwKi67Vk7MD18/wCRoHegXBtA5FwL+dPCH1Vu4E1o20LfNFO0
 kXOEndB+Vn1Mh0ETBqovzKESjA27zRiME6kwUYI/2agqR9xf668Pp0WR0KP53eiDKSxZ
 DQtKzhsUkMF6CSKLT4WID/6P/beMy5uSS9ZHrsrNDab/lNFT7UJGFNQ664SuEnDlXfh0
 t/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H0TISaNkSo0AOOXgytG7SseX5lKfW1MmJ+wa2SSDqxs=;
 b=mRFG/b5kBmCXRj4FWGB+r7mwnS3Ob0adORof+/fnzqEjCjykZFuWs5YZyW/KlToJqX
 SGXfcHbpK6OEshLU01v8NBsNAsvJMrckdlk1WQBFC1Vjdtc0aPgmFXoB56Urg5Frqs8Y
 1ET+gvdFP64YDFFeM1M7IobyA/jOLGsJe5ywH5MBoGrr9jNuBHYxfCDwkt4b1ioo1sBH
 LmRUSquadrJbznGmISJyBWp8HAOOwABRWByerEs+HGzBysrpvly1kPUxoMmiwUIP2TPZ
 Cm7TGB9krz9TvANZdaJdAfMWatHSYRlyvIgtxOdzv+ot1eGwgQst0GQJUaw1q3MeHJbJ
 fNqQ==
X-Gm-Message-State: AOAM530TaxBHeMBc1XFbZh5AHQen1wAjshDszfDKqQkKPBxpq1I66BpU
 8WNm8jbBi9KvndTn5+yUsvLM7zfNKbeS8QjjdQ==
X-Google-Smtp-Source: ABdhPJzNekMZxNCPbVsbudX3Jnh4qJmQF/x7S0UCQJ33vQ8+kLdt6BbDpMssQFcQV9NC7iHbxjrBnLKAwdPviZ2Xals=
X-Received: by 2002:a62:4e4e:0:b0:4fa:b1d4:3405 with SMTP id
 c75-20020a624e4e000000b004fab1d43405mr53252542pfb.71.1648999859272; Sun, 03
 Apr 2022 08:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhUBjmFhqTLBscHHVZ1VTSqrJBT1VEevA+KkjY+y9_ZtdRkMg@mail.gmail.com>
 <631f03bd-0fdf-9cc8-bf37-89235fb84162@gmx.de>
In-Reply-To: <631f03bd-0fdf-9cc8-bf37-89235fb84162@gmx.de>
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Sun, 3 Apr 2022 23:30:48 +0800
Message-ID: <CAMhUBjnZ-=Vyxsh41dd=iU1gFHKDNgyeytSKeztsDoAWKwC+tA@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFtCVUddIGZiZGV2OiBpNzQwZmI6IERpdmlkZSBlcnJvciB3aGVuIOKAmHZhci0+cA==?=
 =?UTF-8?B?aXhjbG9ja+KAmSBpcyB6ZXJv?=
To: Helge Deller <deller@gmx.de>
Content-Type: multipart/alternative; boundary="000000000000d8c16705dbc1b2da"
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
Cc: linux-fbdev@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000d8c16705dbc1b2da
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 3, 2022, 23:02 Helge Deller <deller@gmx.de> wrote:

> On 4/3/22 13:26, Zheyu Ma wrote:
> > Hi,
> >
> > I found a bug in the function i740fb_set_par().
>
> Nice catch!
>
> > When the user calls the ioctl system call without setting the value to
> > 'var->pixclock', the driver will throw a divide error.
> >
> > This bug occurs because the driver uses the value of 'var->pixclock'
> > without checking it, as the following code snippet show:
> >
> > if ((1000000 / var->pixclock) > DACSPEED8) {
> >      dev_err(info->device, "requested pixclock %i MHz out of range
> > (max. %i MHz at 8bpp)\n",
> >          1000000 / var->pixclock, DACSPEED8);
> >     return -EINVAL;x
> > }
> >
> > We can fix this by checking the value of 'var->pixclock' in the
> > function i740fb_check_var() similar to commit
> > b36b242d4b8ea178f7fd038965e3cac7f30c3f09, or we should set the lowest
> > supported value when this field is zero.
> > I have no idea about which solution is better.
>
> Me neither.
> I think a solution like commit b36b242d4b8ea178f7fd038965e3cac7f30c3f09
> is sufficient.
>
> Note that i740fb_set_par() is called in i740fb_resume() as well.
> Since this doesn't comes form userspace I think adding a check for
> the return value there isn't necessary.
>
> Would you mind sending a patch like
> b36b242d4b8ea178f7fd038965e3cac7f30c3f09 ?
>

OK, and I also found similar bugs in other framebuffer drivers, I will send
a patch set for them soon.

Zheyu Ma

>

--000000000000d8c16705dbc1b2da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Sun, Apr 3, 2022, 23:02 Helge Deller &lt;<a href=3D"mailto:=
deller@gmx.de">deller@gmx.de</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">On 4/3/22 13:26, Zheyu Ma wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I found a bug in the function i740fb_set_par().<br>
<br>
Nice catch!<br>
<br>
&gt; When the user calls the ioctl system call without setting the value to=
<br>
&gt; &#39;var-&gt;pixclock&#39;, the driver will throw a divide error.<br>
&gt;<br>
&gt; This bug occurs because the driver uses the value of &#39;var-&gt;pixc=
lock&#39;<br>
&gt; without checking it, as the following code snippet show:<br>
&gt;<br>
&gt; if ((1000000 / var-&gt;pixclock) &gt; DACSPEED8) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dev_err(info-&gt;device, &quot;requested pixclock =
%i MHz out of range<br>
&gt; (max. %i MHz at 8bpp)\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1000000 / var-&gt;pixclock, DACSPEED=
8);<br>
&gt;=C2=A0 =C2=A0 =C2=A0return -EINVAL;x<br>
&gt; }<br>
&gt;<br>
&gt; We can fix this by checking the value of &#39;var-&gt;pixclock&#39; in=
 the<br>
&gt; function i740fb_check_var() similar to commit<br>
&gt; b36b242d4b8ea178f7fd038965e3cac7f30c3f09, or we should set the lowest<=
br>
&gt; supported value when this field is zero.<br>
&gt; I have no idea about which solution is better.<br>
<br>
Me neither.<br>
I think a solution like commit b36b242d4b8ea178f7fd038965e3cac7f30c3f09<br>
is sufficient.<br>
<br>
Note that i740fb_set_par() is called in i740fb_resume() as well.<br>
Since this doesn&#39;t comes form userspace I think adding a check for<br>
the return value there isn&#39;t necessary.<br>
<br>
Would you mind sending a patch like b36b242d4b8ea178f7fd038965e3cac7f30c3f0=
9 ?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">OK, and I also found similar bugs in other framebuffer drivers, I will s=
end a patch set for them soon.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Zheyu Ma</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000d8c16705dbc1b2da--
