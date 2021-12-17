Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2A447961E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 22:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC32810E36B;
	Fri, 17 Dec 2021 21:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7B510E36B;
 Fri, 17 Dec 2021 21:19:14 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id be32so5463475oib.11;
 Fri, 17 Dec 2021 13:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+3zG98dhkknDPg0guLaL1wLcjtaO+4bciqLoXH/PZo4=;
 b=PTUDy+uRKXkxMGYzBB6nwi6qjnGaTPAIls7AP/2jlVKJJyk5uQN75N5zt7DCK/2+I+
 syQeS0W4144KsS/CN2M4wGaO4fcBwSXlGIvP7d0veKltPWVfpPzDCLEnwLosLDta1NUP
 kpymoVDSESqtlVMHAQXkAjnqMR97taNcXCSiF8txvdqr3SA/DQrQmUSLU1AjCk5CeFyP
 Xjw9kJeJZR5V2/ee/bizgOPXG32bga+kx7aqGaSfq2obFExTmIXoJySgoxT21hzU3Jvr
 CjgRyBVxwzBy9d3uMZMDxC9806nxN3pnWPhuNSNzTEZhPj0oaV5MkwyMwLNAypTR2NKh
 oL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+3zG98dhkknDPg0guLaL1wLcjtaO+4bciqLoXH/PZo4=;
 b=epZE+sXXS/Ssc9rTJxhuMPJ9Oaffp1NV7xVPa9DXp2NSXlljSwhqNsUOUj6QpJ1Ojo
 4ClN3P9KZwhTnVUEICtKzIqqp3nieeSEx7Y0X8WacKimWXHHKd1uLdAygpyicZavYWke
 d4LW+ttDketDc3UYEpIsss2HKpvmqE6ae6YtC6Dh0bfmVNiT0vaRikxqcgArhFAcH/RW
 c3CLjJvUs449D3F62CCfnic1bPHQAeEAcDTDTQGZ+KR8hP1NgRsYWBQ5iPSJ0r8MOvs2
 p7EntPLUT6weu93/LkTMtxIQ04dqKZ4x6mSqaAOrgko6MdLO9fGZfDuUJrZ2Bo5jwbGp
 6N+w==
X-Gm-Message-State: AOAM532x+hjNSjyDtwcsuKDNjI61FIDECijWIUIuFcIGE0anZjFE/3p2
 s3+oGkIJujoGlbgUQbF8YWjrMLvpOuDOSeCt+4Q=
X-Google-Smtp-Source: ABdhPJxdXhTBT7/nc/jrdhDMwZ8Glw2/vRnOlNZ1lHjtfHgMUtTK0ONRjp6amV9WUSiIS9HZB57Uo7RsY25z4LdO8N8=
X-Received: by 2002:a05:6808:300b:: with SMTP id
 ay11mr3624298oib.120.1639775953328; 
 Fri, 17 Dec 2021 13:19:13 -0800 (PST)
MIME-Version: 1.0
References: <u7vio364zx-u7wslwl6tq@nsmail6.0>
In-Reply-To: <u7vio364zx-u7wslwl6tq@nsmail6.0>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Dec 2021 16:19:01 -0500
Message-ID: <CADnq5_M5DebMiRWUsh8=O61h=pLCDrJ7nO1rTJTHnrcj4HZEPw@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFJlOiBSZTog5Zue5aSNOiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1OiBmaXh1cCBiYQ==?=
 =?UTF-8?B?ZCB2cmFtIHNpemUgb24gZ21jIHY4?=
To: =?UTF-8?B?5ZGo5a6X5pWP?= <zhouzongmin@kylinos.cn>
Content-Type: multipart/alternative; boundary="00000000000035a02505d35e173a"
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000035a02505d35e173a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If you could get me a copy of the vbios image from a problematic board,
that would be helpful.  In the meantime, I've applied the patch.

Alex


On Thu, Dec 16, 2021 at 9:38 PM =E5=91=A8=E5=AE=97=E6=95=8F <zhouzongmin@ky=
linos.cn> wrote:

> Dear Alex:
>
>
> >Is the issue reproducible with the same board in bare metal on x86?Or
> does it only happen with passthrough on ARM?
>
>
> Unfortunately, my current environment is not convenient to test this GPU
> board on x86 platform.
>
> but I can tell you the problem still occurs on ARM without passthrough to
> virtual machine.
>
>
> In addition,at end of 2020,my colleagues also found similar problems on
> MIPS platforms with Graphics chips of Radeon R7 340.
>
> So,I may think it can happen to no matter based on x86 ,ARM or mips.
>
>
> I hope the above information is helpful to you=EF=BC=8Cand I also think i=
t will be
> better for user if can root cause this issue.
>
>
> Best regards.
>
>
>
>
> ----
>
>
>
>
>
>
> *=E4=B8=BB =E9=A2=98=EF=BC=9A*Re: Re: =E5=9B=9E=E5=A4=8D: Re: [PATCH] drm=
/amdgpu: fixup bad vram size on gmc v8
>
> *=E6=97=A5 =E6=9C=9F=EF=BC=9A*2021-12-16 23:28
> *=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A*Alex Deucher
> *=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A*=E5=91=A8=E5=AE=97=E6=95=8F
>
>
> Is the issue reproducible with the same board in bare metal on x86?  Or
> does it only happen with passthrough on ARM?  Looking through the archive=
s,
> the SI patch I made was for an x86 laptop.  It would be nice to root
> cause this, but there weren't any gfx8 boards with more than 64G of vram,
> so I think it's safe.  That said, if you see similar issues with newer gf=
x
> IPs then we have an issue since the upper bit will be meaningful, so it
> would be nice to root cause this.
>
> Alex
>
>
> On Thu, Dec 16, 2021 at 4:36 AM =E5=91=A8=E5=AE=97=E6=95=8F <zhouzongmin@=
kylinos.cn> wrote:
>
>> Hi  Christian,
>>
>>
>> I'm  testing for GPU passthrough feature, so I pass through this GPU to
>> virtual machine to use. It  based on arm64 system.
>>
>> As far as i know, Alex had dealt with a similar problems on
>> dri/radeon/si.c .  Maybe they have a same reason to cause it?
>>
>> the history commit message is below:
>>
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3D0ca223b029a261e82fb2f50c52eb85d510f4260e
>>
>> [image: image.png]
>>
>>
>> Thanks very much.
>>
>>
>>
>> ----
>>
>>
>>
>> *=E4=B8=BB =E9=A2=98=EF=BC=9A*Re: =E5=9B=9E=E5=A4=8D: Re: [PATCH] drm/am=
dgpu: fixup bad vram size on gmc v8
>>
>> *=E6=97=A5 =E6=9C=9F=EF=BC=9A*2021-12-16 16:15
>> *=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A*Christian K=C3=B6nig
>> *=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A*=E5=91=A8=E5=AE=97=E6=95=8FAlex De=
ucher
>>
>>
>>
>>
>> Hi Zongmin,
>>
>>    that strongly sounds like the ASIC is not correctly initialized when
>>  trying to read the register.
>>
>>    What board and environment are you using this GPU with? Is that a
>>  normal x86 system?
>>
>>    Regards,
>>    Christian.
>>
>>
>>
>> Am 16.12.21 um 04:11 schrieb =E5=91=A8=E5=AE=97=E6=95=8F:
>>
>>
>>
>>    1.
>>
>>    the problematic boards that I have tested is [AMD/ATI] Lexa
>>     PRO [Radeon RX 550/550X] ;  and the vbios version :
>>     113-RXF9310-C09-BT
>>    2.
>>
>>    When an exception occurs I can see the following changes in
>>     the values of vram size get from RREG32(mmCONFIG_MEMSIZE) ,
>>
>>    it seems to have garbage in the upper 16 bits
>>
>>    [image: image.png]
>>
>>
>>
>>
>>    3.
>>
>>    and then I can also see some dmesg like below:
>>
>>    when vram size register have garbage,we may see error
>>     message like below:
>>
>>    amdgpu 0000:09:00.0: VRAM: 4286582784M 0x000000F400000000 -
>>     0x000FF8F4FFFFFFFF (4286582784M used)
>>
>>    the correct message should like below:
>>
>>    amdgpu 0000:09:00.0: VRAM: 4096M 0x000000F400000000 -
>>     0x000000F4FFFFFFFF (4096M used)
>>
>>
>>
>>
>>    if you have any problems,please send me mail.
>>
>>    thanks very much.
>>
>>
>>
>>
>> ----
>>
>> *=E4=B8=BB =E9=A2=98=EF=BC=9A*Re: [PATCH] drm/amdgpu:          fixup bad=
 vram size on gmc v8
>>
>>        *=E6=97=A5 =E6=9C=9F=EF=BC=9A*2021-12-16 04:23
>>        *=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A*Alex Deucher
>>        *=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A*Zongmin Zhou
>>
>>
>>
>>
>> On Wed, Dec 15, 2021 at 10:31 AM Zongmin Zhouwrote:
>>          >
>>          > Some boards(like RX550) seem to have garbage in the upper
>>          > 16 bits of the vram size register.  Check for
>>          > this and clamp the size properly.  Fixes
>>          > boards reporting bogus amounts of vram.
>>          >
>>          > after add this patch,the maximum GPU VRAM size is 64GB,
>>          > otherwise only 64GB vram size will be used.
>>
>>          Can you provide some examples of problematic boards and
>>  possibly a
>>          vbios image from the problematic board?  What values are you
>>      seeing?
>>          It would be nice to see what the boards are reporting and
>>    whether the
>>          lower 16 bits are actually correct or if it is some other
>>    issue.  This
>>          register is undefined until the asic has been initialized.
>>     The vbios
>>          programs it as part of it's asic init sequence (either via
>>    vesa/gop or
>>          the OS driver).
>>
>>          Alex
>>
>>
>>          >
>>          > Signed-off-by: Zongmin Zhou
>>            > ---
>>            >  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c | 13
>>  ++++++++++---
>>            >  1 file changed, 10 insertions(+), 3 deletions(-)
>>            >
>>            > diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>  b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>            > index 492ebed2915b..63b890f1e8af 100644
>>            > --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>            > +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>            > @@ -515,10 +515,10 @@ static void
>>  gmc_v8_0_mc_program(struct amdgpu_device *adev)
>>            >  static int gmc_v8_0_mc_init(struct amdgpu_device
>>  *adev)
>>            >  {
>>            >         int r;
>>            > +       u32 tmp;
>>            >
>>            >         adev->gmc.vram_width =3D
>>  amdgpu_atombios_get_vram_width(adev);
>>            >         if (!adev->gmc.vram_width) {
>>            > -               u32 tmp;
>>            >                 int chansize, numchan;
>>            >
>>            >                 /* Get VRAM informations */
>>            > @@ -562,8 +562,15 @@ static int gmc_v8_0_mc_init(struct
>>        amdgpu_device *adev)
>>            >                 adev->gmc.vram_width =3D numchan *
>>  chansize;
>>            >         }
>>            >         /* size in MB on si */
>>            > -       adev->gmc.mc_vram_size =3D
>>  RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;
>>            > -       adev->gmc.real_vram_size =3D
>>  RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;
>>            > +       tmp =3D RREG32(mmCONFIG_MEMSIZE);
>>            > +       /* some boards may have garbage in the upper 16
>>        bits */
>>            > +       if (tmp & 0xffff0000) {
>>            > +               DRM_INFO("Probable bad vram size:
>>  0x%08x\n", tmp);
>>            > +               if (tmp & 0xffff)
>>            > +                       tmp &=3D 0xffff;
>>            > +       }
>>            > +       adev->gmc.mc_vram_size =3D tmp * 1024ULL *
>>  1024ULL;
>>            > +       adev->gmc.real_vram_size =3D
>>  adev->gmc.mc_vram_size;
>>            >
>>            >         if (!(adev->flags & AMD_IS_APU)) {
>>            >                 r =3D amdgpu_device_resize_fb_bar(adev);
>>            > --
>>            > 2.25.1
>>            >
>>            >
>>            > No virus found
>>            >                 Checked by Hillstone Network AntiVirus
>>
>>
>>
>>
>>
>

--00000000000035a02505d35e173a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>If you could get me a copy of the vbios image from a =
problematic board, that would be helpful.=C2=A0 In the meantime, I&#39;ve a=
pplied the patch.</div><div><br></div><div>Alex</div><div><br></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 1=
6, 2021 at 9:38 PM =E5=91=A8=E5=AE=97=E6=95=8F &lt;<a href=3D"mailto:zhouzo=
ngmin@kylinos.cn">zhouzongmin@kylinos.cn</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><p>Dear Alex:</p><p><br></p><p><spa=
n style=3D"color:rgb(192,80,77)">&gt;Is the issue reproducible with the sam=
e board in bare metal on x86?Or does it only happen with passthrough on ARM=
?</span></p><p><br></p><p>Unfortunately, my current environment is not conv=
enient to test this GPU board on x86 platform.</p><p>but I can tell you the=
 problem still occurs on ARM without passthrough to virtual machine.</p><p>=
<br></p><p>In addition,at end of 2020,my colleagues also found similar prob=
lems on MIPS platforms with Graphics chips of Radeon R7 340.</p><p>So,I may=
 think it can happen to no matter based on x86 ,ARM or mips.</p><p><br></p>=
<p>I hope the above information is helpful to you=EF=BC=8Cand I also think =
it will be better for user if can=C2=A0root cause this issue.</p><p><br></p=
><p>Best regards.</p><br><br>

 =C2=A0 =C2=A0<p>----</p><p></p><p><br></p><p></p><div id=3D"gmail-m_527949=
4021112996146re" style=3D"margin-left:0.5em;padding-left:0.5em;border-left:=
1px solid green"><br><br><br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0<div style=3D"background-color:rgb(245,247,250)=
"><b>=E4=B8=BB=E3=80=80=E9=A2=98=EF=BC=9A</b><span id=3D"gmail-m_5279494021=
112996146subject">Re: Re: =E5=9B=9E=E5=A4=8D: Re: [PATCH] drm/amdgpu: fixup=
 bad vram size on gmc v8</span>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br><b>=E6=97=A5=E3=80=80=E6=9C=
=9F=EF=BC=9A</b><span id=3D"gmail-m_5279494021112996146date">2021-12-16 23:=
28</span>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br><b>=E5=8F=91=E4=BB=B6=E4=BA=
=BA=EF=BC=9A</b><span id=3D"gmail-m_5279494021112996146from">Alex Deucher</=
span>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br><b>=E6=94=B6=E4=BB=B6=E4=BA=
=BA=EF=BC=9A</b><span id=3D"gmail-m_5279494021112996146to">=E5=91=A8=E5=AE=
=97=E6=95=8F</span>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div><br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0<div id=3D"gmail-m_5279494021112996146content">=
<div><div><div dir=3D"ltr"><div>Is the issue reproducible with the same boa=
rd in bare metal on x86?=C2=A0 Or does it only happen with passthrough on A=
RM?=C2=A0 Looking through the archives, the SI patch I made was for an x86 =
laptop.=C2=A0 <span>It</span> would be nice to root cause this, but there w=
eren&#39;t any gfx8 boards with more than 64G of vram, so I think it&#39;s =
safe.=C2=A0 That said, if you see similar issues with newer gfx IPs then we=
 have an issue since the upper bit will be meaningful, so it would be nice =
to root cause this.<br></div><br><div>Alex</div><br></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 16, 2021 at=
 4:36 AM =E5=91=A8=E5=AE=97=E6=95=8F &lt;<a href=3D"mailto:zhouzongmin@kyli=
nos.cn" target=3D"_blank">zhouzongmin@kylinos.cn</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><p>Hi=C2=A0=C2=A0Christian,=
</p><p><br></p><p>I&#39;m=C2=A0 testing for GPU passthrough feature, so I p=
ass through this GPU to=C2=A0 virtual machine to use. It=C2=A0 based on arm=
64 system.</p><br><p>As far as i know, Alex had dealt with a similar proble=
ms on dri/radeon/si.c .=C2=A0 Maybe they have a same reason to cause it?</p=
><p>the history commit message is below:</p><p><a href=3D"https://git.kerne=
l.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3D0ca223b029a2=
61e82fb2f50c52eb85d510f4260e" target=3D"_blank">https://git.kernel.org/pub/=
scm/linux/kernel/git/torvalds/linux.git/commit/?id=3D0ca223b029a261e82fb2f5=
0c52eb85d510f4260e</a></p><p><img src=3D"http:///nsmail/js/ueditor/php/uplo=
ad/image/20211216/1639647221165090.png" title=3D"1639647221165090.png" alt=
=3D"image.png"></p><p><br></p><p>Thanks very much.</p><p>=C2=A0 =C2=A0<br><=
/p><p>----</p><p>=C2=A0 =C2=A0=C2=A0</p><p><b>=E4=B8=BB=E3=80=80=E9=A2=98=
=EF=BC=9A</b><span id=3D"gmail-m_5279494021112996146gmail-m_515247130580575=
6242gmail-m_8043105273083894711subject">Re: =E5=9B=9E=E5=A4=8D: Re: [PATCH]=
 drm/amdgpu: fixup bad vram size on gmc v8</span>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br><b>=E6=97=A5=E3=80=80=E6=9C=
=9F=EF=BC=9A</b><span id=3D"gmail-m_5279494021112996146gmail-m_515247130580=
5756242gmail-m_8043105273083894711date">2021-12-16 16:15</span>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br><b>=E5=8F=91=E4=BB=B6=E4=BA=
=BA=EF=BC=9A</b><span id=3D"gmail-m_5279494021112996146gmail-m_515247130580=
5756242gmail-m_8043105273083894711from">Christian K=C3=B6nig</span>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br><b>=E6=94=B6=E4=BB=B6=E4=BA=
=BA=EF=BC=9A</b><span id=3D"gmail-m_5279494021112996146gmail-m_515247130580=
5756242gmail-m_8043105273083894711to">=E5=91=A8=E5=AE=97=E6=95=8FAlex Deuch=
er</span>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
 =C2=A0 =C2=A0 =C2=A0 =C2=A0</p><p><br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0</p><p>Hi Zongmin,<br>
 =C2=A0 =C2=A0<br>
 =C2=A0 =C2=A0that strongly sounds like the ASIC is not correctly initializ=
ed when
 =C2=A0 =C2=A0trying to read the register.<br>
 =C2=A0 =C2=A0<br>
 =C2=A0 =C2=A0What board and environment are you using this GPU with? Is th=
at a
 =C2=A0 =C2=A0normal x86 system?<br>
 =C2=A0 =C2=A0<br>
 =C2=A0 =C2=A0Regards,<br>
 =C2=A0 =C2=A0Christian.<br>
 =C2=A0 =C2=A0<br>
 =C2=A0 =C2=A0</p><p>Am 16.12.21 um 04:11 schrieb =E5=91=A8=E5=AE=97=E6=95=
=8F:<br>
 =C2=A0 =C2=A0</p><blockquote type=3D"cite"><ol style=3D"list-style-type:de=
cimal"><li><p>the=C2=A0problematic boards that I have tested is=C2=A0[AMD/A=
TI] Lexa
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PRO [Radeon RX 550/550X] ;=C2=A0 =
and the vbios version :
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0113-RXF9310-C09-BT</p></li><li><p=
>When an exception occurs I can see the following changes in
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the values of vram size get from =
RREG32(mmCONFIG_MEMSIZE) ,</p><p>it seems=C2=A0to have garbage in the upper=
 16 bits=C2=A0</p><p><img src=3D"http:///nsmail/js/ueditor/php/upload/image=
/20211216/1639623655693645.png" title=3D"1639623655693645.png" alt=3D"image=
.png"><br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</p><p><br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</p></li><li><p>and then I can also see =
some dmesg like below:</p><p>when vram size register have garbage,we may se=
e error
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0message like below:</p><p>amdgpu =
0000:09:00.0: VRAM: 4286582784M 0x000000F400000000 -
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x000FF8F4FFFFFFFF (4286582784M u=
sed)</p><p>the correct message should like below:</p><p>amdgpu 0000:09:00.0=
: VRAM: 4096M 0x000000F400000000 -
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x000000F4FFFFFFFF (4096M used)</=
p><p><br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</p><p>if you have any problems,please s=
end me mail.</p><p>thanks very much.</p><p><br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</p></li></ol><p>----=C2=A0 =C2=A0 =C2=
=A0=C2=A0</p><p><b>=E4=B8=BB=E3=80=80=E9=A2=98=EF=BC=9A</b><span id=3D"gmai=
l-m_5279494021112996146gmail-m_5152471305805756242gmail-m_80431052730838947=
11subject">Re: [PATCH] drm/amdgpu:
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fixup bad vram size on gmc v8</span> =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0<b>=E6=97=A5=E3=80=80=E6=9C=9F=EF=BC=9A</b><spa=
n id=3D"gmail-m_5279494021112996146gmail-m_5152471305805756242gmail-m_80431=
05273083894711date">2021-12-16 04:23</span> =C2=A0 =C2=A0
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0<b>=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A</b><spa=
n id=3D"gmail-m_5279494021112996146gmail-m_5152471305805756242gmail-m_80431=
05273083894711from">Alex Deucher</span> =C2=A0 =C2=A0 =C2=A0 =C2=A0
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0<b>=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A</b><spa=
n id=3D"gmail-m_5279494021112996146gmail-m_5152471305805756242gmail-m_80431=
05273083894711to">Zongmin Zhou</span> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</p><p><br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0</p><p>On Wed, Dec 1=
5, 2021 at 10:31 AM Zongmin Zhouwrote:<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Some boards(like RX550) seem to hav=
e garbage in the upper<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 16 bits of the vram size register.=
=C2=A0 Check for<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; this and clamp the size properly.=
=C2=A0 Fixes<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; boards reporting bogus amounts of v=
ram.<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; after add this patch,the maximum GP=
U VRAM size is 64GB,<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; otherwise only 64GB vram size will =
be used.<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Can you provide some examples of problem=
atic boards and
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0possibly a<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vbios image from the problematic board?=
=C2=A0 What values are you
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seeing?<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0It would be nice to see what the boards =
are reporting and
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0whether the<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lower 16 bits are actually correct or if=
 it is some other
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0issue.=C2=A0 This<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0register is undefined until the asic has=
 been initialized.
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0The vbios<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0programs it as part of it&#39;s asic ini=
t sequence (either via
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vesa/gop or<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the OS driver).<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Alex<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Zongmin Zhou<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; ---<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0drivers/gpu/drm/amd/am=
dgpu/gmc_v8_0.c | 13
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0++++++++++---<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A01 file changed, 10 ins=
ertions(+), 3 deletions(-)<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; diff --git a/drivers/gpu/drm=
/amd/amdgpu/gmc_v8_0.c
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/drivers/gpu/drm/amd/amdgpu/gmc_=
v8_0.c<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; index 492ebed2915b..63b890f1=
e8af 100644<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; --- a/drivers/gpu/drm/amd/am=
dgpu/gmc_v8_0.c<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; +++ b/drivers/gpu/drm/amd/am=
dgpu/gmc_v8_0.c<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; @@ -515,10 +515,10 @@ static=
 void
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gmc_v8_0_mc_program(struct amdgpu=
_device *adev)<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0static int gmc_v8_0_mc=
_init(struct amdgpu_device
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*adev)<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0{<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
int r;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; + =C2=A0 =C2=A0 =C2=A0 u32 t=
mp;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
adev-&gt;gmc.vram_width =3D
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_atombios_get_vram_width(ad=
ev);<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
if (!adev-&gt;gmc.vram_width) {<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 u32 tmp;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int chansize, numchan;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Get VRAM informations */<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; @@ -562,8 +562,15 @@ static =
int gmc_v8_0_mc_init(struct
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_device *adev)<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 adev-&gt;gmc.vram_width =3D numchan *
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chansize;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
}<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
/* size in MB on si */<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; - =C2=A0 =C2=A0 =C2=A0 adev-=
&gt;gmc.mc_vram_size =3D
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RREG32(mmCONFIG_MEMSIZE) * 1024UL=
L * 1024ULL;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; - =C2=A0 =C2=A0 =C2=A0 adev-=
&gt;gmc.real_vram_size =3D
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RREG32(mmCONFIG_MEMSIZE) * 1024UL=
L * 1024ULL;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; + =C2=A0 =C2=A0 =C2=A0 tmp =
=3D RREG32(mmCONFIG_MEMSIZE);<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; + =C2=A0 =C2=A0 =C2=A0 /* so=
me boards may have garbage in the upper 16
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bits */<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; + =C2=A0 =C2=A0 =C2=A0 if (t=
mp &amp; 0xffff0000) {<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 DRM_INFO(&quot;Probable bad vram size:
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x%08x\n&quot;, tmp);<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if (tmp &amp; 0xffff)<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp &amp;=3D 0xffff;<b=
r>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; + =C2=A0 =C2=A0 =C2=A0 adev-=
&gt;gmc.mc_vram_size =3D tmp * 1024ULL *
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01024ULL;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; + =C2=A0 =C2=A0 =C2=A0 adev-=
&gt;gmc.real_vram_size =3D
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;gmc.mc_vram_size;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
if (!(adev-&gt;flags &amp; AMD_IS_APU)) {<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D amdgpu_device_resize_fb_bar(adev);<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; --<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 2.25.1<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; No virus found<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Checked by Hillstone Network AntiVirus<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</p></blockquote><p><br>
 =C2=A0</p></blockquote></div></div></div></div></div></blockquote></div></=
div>

--00000000000035a02505d35e173a--
