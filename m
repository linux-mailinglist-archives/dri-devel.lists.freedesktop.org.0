Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA3B165991
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 09:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB216ECFF;
	Thu, 20 Feb 2020 08:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A00E6E85F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 20:17:10 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p9so2093056wmc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 12:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hackillinois.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=Je/scCDM4kOFoevjJku7WB/rYuRYjG6e8ZgV1ygvlM8=;
 b=RGOkzFKERdIQOYXzalx9p3NHWiqGzGj+X1hVWn7OV8UFCkW5QiFBEbXocRZU0ImYFM
 Lgp7XhWZV0Ocsx7LOfPHTHl42QJUMxLz44DPxRcpCOAKaFCx5ZCPfNSynOH7bHJMHLbo
 2t3T08/0j7wuL+QATOh/5FbT6gzjBCqGAx2HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Je/scCDM4kOFoevjJku7WB/rYuRYjG6e8ZgV1ygvlM8=;
 b=bA4M3Be88LKylWSDY8kS0y3sAo7v5D0VNaWeUUFooHrdOSF7dwhDGSCKabhf+Fh8KB
 q9VLha5EBSalejD9SOEdZxbE7z3jlrqVyHT8FxJS2/4tcfskVcwGjRYFlIo4i9eH3682
 1UaBdEbiYOIxFY6/yfYRJZ8dX/+YT4tQNFZXro4DT+jX4UM+paV6d18rAgGvjutL8N0S
 eqb4Ny5B0+kevFqSxNLzj/knhLOQrsnycltKgBkml9HwOGLgLaxzpyvwu65eoSVUO0Ku
 Y2ecHclaTxzDiEFugggvaZQ7ZCqUb8P2MK+VXNaBwVUmO9UvR3EFx6vZr32j4qdmPa7f
 1BdQ==
X-Gm-Message-State: APjAAAUFUWlHMIhxe64LYnMzCuEh1nUzmHgzRPsXVl7SqbrEfdcnA4/9
 W8R4+cmZD2s8znSp0zBUzs1f9BR3c5joRg47r/3t+1itN9hkyB4Z
X-Google-Smtp-Source: APXvYqxfUCeXbO2JAGohkTIfo2KtvLOdn24b+ELxgNI7bIix7uvbxxlO54oUOnU86mLVSEhpI5IjLqbPitBN90RieeI=
X-Received: by 2002:a1c:9a0d:: with SMTP id c13mr4308455wme.41.1582143428888; 
 Wed, 19 Feb 2020 12:17:08 -0800 (PST)
MIME-Version: 1.0
From: Misha Patel <misha.patel@hackillinois.org>
Date: Wed, 19 Feb 2020 14:16:57 -0600
Message-ID: <CAJOGcdBb_yDBCjtDPfvac8tOhZ0biWLxOugfOxxKGo8zWxuDwQ@mail.gmail.com>
Subject: Open Source Hackathon Mentorship Invitation
To: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 20 Feb 2020 08:45:37 +0000
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
Content-Type: multipart/mixed; boundary="===============0635465093=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0635465093==
Content-Type: multipart/alternative; boundary="000000000000101559059ef379b9"

--000000000000101559059ef379b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

My name is Misha Patel and I=E2=80=99m reaching out on behalf of the HackIl=
linois
Outreach team. HackIllinois is a 36-hour collegiate Open Source hackathon
that takes place annually at the University of Illinois Urbana-Champaign.
This year, it will be from February 28th-March 1st, 2020. Our mission is to
introduce college students to Open Source, while giving back to the
community. We strive to create a collaborative environment in which our
attendees can learn from and work with developers to make their own
contributions. In past years, we=E2=80=99ve had developers from prominent p=
rojects
such as npm, Rust, and Apache come to mentor students from our pool of 900+
attendees.

We=E2=80=99d love it if you could pass along this message to the X.Org Foun=
dation
community or any individuals you believe would be interested. We will
provide meals throughout the event and can reimburse for travel and lodging
up to a certain amount depending on where in the US people are coming from.
More information on mentorship can be found at hackillinois.org/mentor. You
can also visit opensource.hackillinois.org to see what kinds of projects
were represented at our event last year.

Best,
Misha Patel
HackIllinois 2020 Outreach Director

--000000000000101559059ef379b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"arial, sans-serif">Hello,<br><br>My name is =
Misha Patel and I=E2=80=99m reaching out on behalf of the HackIllinois Outr=
each team. HackIllinois is a 36-hour collegiate Open Source hackathon that =
takes place annually at the University of Illinois Urbana-Champaign. This y=
ear, it will be from February 28th-March 1st, 2020. Our mission is to intro=
duce college students to Open Source, while giving back to the community. W=
e strive to create a collaborative environment in which our attendees can l=
earn from and work with developers to make their own contributions. In past=
 years, we=E2=80=99ve had developers from prominent projects such as npm, R=
ust, and Apache come to mentor students from our pool of 900+ attendees. <b=
r><br>We=E2=80=99d love it if you could pass along this message to the X.Or=
g Foundation community or any individuals you believe would be interested. =
We will provide meals throughout the event and can reimburse for travel and=
 lodging up to a certain amount depending on where in the US people are com=
ing from. More information on mentorship can be found at <a href=3D"http://=
hackillinois.org/mentor" target=3D"_blank">hackillinois.org/mentor</a>. You=
 can also visit <a href=3D"http://opensource.hackillinois.org" target=3D"_b=
lank">opensource.hackillinois.org</a> to see what kinds of projects were re=
presented at our event last year.<br></font><div><font face=3D"arial, sans-=
serif"><br></font></div><div><font face=3D"arial, sans-serif">Best,</font><=
/div><div><font face=3D"arial, sans-serif">Misha Patel</font></div><div><fo=
nt face=3D"arial, sans-serif">HackIllinois 2020 Outreach Director=C2=A0</fo=
nt></div></div>

--000000000000101559059ef379b9--

--===============0635465093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0635465093==--
