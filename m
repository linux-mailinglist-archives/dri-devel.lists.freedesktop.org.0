Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2784BAA6D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C782810E744;
	Thu, 17 Feb 2022 19:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236AF10E740;
 Thu, 17 Feb 2022 19:56:26 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id h11so3073731ilq.9;
 Thu, 17 Feb 2022 11:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=8GFxXYwx/5UCE/Qb/4WuhMlmB3dLbwTPQFbWmG3kKsM=;
 b=ket0vNCCv7LXRrKp+zEgT8tdrxxxXs5stWJ3POCkDSLqdIv9RHgUfDUbeqd/h7cnzZ
 wQ+rFJ6zuVDA0EB0CA8GxwIq8+DtzJGQHeDSwrEDaHr5drnmL4H7P0t1qlwu63jYoZ2h
 nfodBeMHPXgqv9ewX6cqW8khsCtk2REn71DxZolhKjBmSq3naEHy7vLpIzq0p1xD9Xbb
 IYSPK1B1XgLI9WO8QioRnFffmf0lXOxn6ujSaPictNyAnBoCdrpCP3HPKpC0k+9JyS8T
 iuWmqqCL9+6F40FvGJBxsRxM++OhVL/GC9WXHlTF5O4MAvyMUo7H/bOYwvKw4oJhot9L
 C/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8GFxXYwx/5UCE/Qb/4WuhMlmB3dLbwTPQFbWmG3kKsM=;
 b=MhegXzU3GZhKyL61lV0WYlQdDg9hkakAzUm7+qKkwa97wwTAi/7XvZMM8wgTIJ5hDB
 ihEiWkPxYYtQRpmKm2eTRGJhGSzm7JmZ9SfkGaUV7ppNRexD42F1b+jhRB2fgv0ahJLU
 I/qhXEvuF1jFDusZznf/w6V/wTtacSGbQGPQy0oFBRlBC5OGv+WzAUO8DO98yGcs6SNm
 eocyufDppCPbJburQg2EQFkugesS+i44IK2wLbOl4XWpuxNN2NFDZdEQZZKN8Ay5cmeh
 pFHe8Qb2AWu6iyAlA169EwTp1YaIp7/QN7L7rkrr//gT3lBXsZaybHT8GjOvAXN/NXpJ
 fn2w==
X-Gm-Message-State: AOAM533PvDgWk0QfSbplg9GFP1pjj4ZzZusJ8T6MbKwXhT4H+XHmIiLQ
 Cn/B/W9yppE1gB89J98Ppo8kbGfgnn4mRNbDLXj+qXS/gnE=
X-Google-Smtp-Source: ABdhPJwoyHz1gKcU6C//YkawUkzzdFFjnj6GjnlN9ljLbEk9c6Vsm7Wio2PoBjmSm+T9pJsDDzNS2D2ErOKDcq5Lg08=
X-Received: by 2002:a05:6e02:1e05:b0:2c1:a4e9:90e with SMTP id
 g5-20020a056e021e0500b002c1a4e9090emr767595ila.174.1645127785161; Thu, 17 Feb
 2022 11:56:25 -0800 (PST)
MIME-Version: 1.0
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 17 Feb 2022 14:56:13 -0500
Message-ID: <CAHUNapT7zzELkRqPt7sWpk+-KVbUTtwThgTnAC=5DTxWWek0Uw@mail.gmail.com>
Subject: X.Org Foundation GSoC mentors and projects
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 "X.Org Devel List" <xorg-devel@lists.x.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="0000000000003eaa7f05d83c2935"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000003eaa7f05d83c2935
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Thanks to the amazing work Rodrigo does mentoring students (which
introduces them to GNU/Linux in general and X.Org/fd.o in particular) it
looks like we might have some potential GSoC candidates this year.

The last time we ran an X.Org GSoC, back in 2020, our amazing student,
Melissa, not only passed her project with flying colours, she continues on
in our community to this day as a co-admin of the VKMS driver. Several
other members of our community came to us via GSoC and are also still with
us making significant contributions.

Rodrigo and Melissa have put together a project they are excited to mentor:
https://www.x.org/wiki/AMDGPU2022/ . Daniel Vetter has also agreed to
mentor; perhaps a drm-related project. I've agreed to be the admin on
behalf of X.Org for our participation in GSoC.

If anyone else is interested in volunteering we would certainly appreciate
the help. We're always looking for mentors and project ideas. Our current
list of projects/mentors is found on our Ideas page:
https://www.x.org/wiki/SummerOfCodeIdeas/

If you have any questions or interest please get in touch!

Best regards,
    Trevor

--0000000000003eaa7f05d83c2935
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,</div><div><br></div><div>Thanks to the a=
mazing work Rodrigo does mentoring students (which introduces them to GNU/L=
inux in general and X.Org/fd.o in particular) it looks like we might have s=
ome potential GSoC candidates this year.<br></div><div><br></div><div>The l=
ast time we ran an X.Org GSoC, back in 2020, our amazing student, Melissa, =
not only passed her project with flying colours, she continues on in our co=
mmunity to this day as a co-admin of the VKMS driver. Several other members=
 of our community came to us via GSoC and are also still with us making sig=
nificant contributions.</div><div><br></div><div>Rodrigo and Melissa have p=
ut together a project they are excited to mentor: <a href=3D"https://www.x.=
org/wiki/AMDGPU2022/">https://www.x.org/wiki/AMDGPU2022/</a> . Daniel Vette=
r has also agreed to mentor; perhaps a drm-related project. I&#39;ve agreed=
 to be the admin on behalf of X.Org for our participation in GSoC.</div><di=
v><br></div><div>If anyone else is interested in volunteering we would cert=
ainly appreciate the help. We&#39;re always looking for mentors and project=
 ideas. Our current list of projects/mentors is found on our Ideas page: <a=
 href=3D"https://www.x.org/wiki/SummerOfCodeIdeas/">https://www.x.org/wiki/=
SummerOfCodeIdeas/</a></div><div><br></div><div>If you have any questions o=
r interest please get in touch!</div><div><br></div><div>Best regards,</div=
><div>=C2=A0=C2=A0=C2=A0 Trevor<br></div></div>

--0000000000003eaa7f05d83c2935--
