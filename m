Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B6E6FBFE4
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 09:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571A110E32F;
	Tue,  9 May 2023 07:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2594910E19E
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 15:05:24 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-b980e16b27bso3099419276.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 08:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=iitbhu.ac.in; s=google; t=1683471922; x=1686063922;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tN3zgueu9U9+Glq711TrIkn5r25M/841aXSnWcva2B0=;
 b=TNSZn1Hlw9Za3qW4IYmaTAHovMc77edZ2tV3sJF985RM9qgrkJ0TDEeeBFCgDBgsOg
 3eFpwOkdVeihBew6LEd0A9WJoidQ7MSeYgkTvVCTBK74djqVXU3StgGItyplLn30AmSA
 z0+yRTsOh7jOznIt7YPqxn+TOwjXaona4AAfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683471922; x=1686063922;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tN3zgueu9U9+Glq711TrIkn5r25M/841aXSnWcva2B0=;
 b=GAhpJf8/gQ3VGcYoVUtLPPCO6I3AASMaMz6ycR2bv9ykCDh5UaPzMorFN/VPyE8+3S
 xWejA3/8OcGztEJluPgLKeN2lCQ2eAlGTet/W6yiRihGNh8bbY7PdFXinon4POQZMxq+
 c5G3huqTl5CyUsY6FJ8HVyn6/Iyfylm8/Cg1+9mhqCkBGenm8+nYLiLLUG20ETfzqYpX
 WfTlW5/NJbfexnXA2v+nkUdboUWWXp0q0IOJ7RFL8MbyAN+hfJow9uvTCOM5zxS7ebiL
 Et8uxTrbJeK+3HWXQNObEAE2j47QPV1B8RalmQ3vAuYDKAeO6BGd6+3YYtHGF7FQpH7e
 fR8Q==
X-Gm-Message-State: AC+VfDzj9kTjBAX2nfkiegK1pisV+xNtWgPGHb9rV+xIf48LKsk9f8+f
 XsbHZiEFJ7M2ekMBe5anvMb24zmhe36qGBssgI5GFOEUS3l9f78jnn0fMA==
X-Google-Smtp-Source: ACHHUZ56e/0Ub7gNAZjy6LGQ58sZeFUZNDU90kbO1RvfPooSZrUZastPI2Fg+b1IZoWs/ha87GSFe/hS2azs3Wo9CK8=
X-Received: by 2002:a0d:db4c:0:b0:559:f181:1a7d with SMTP id
 d73-20020a0ddb4c000000b00559f1811a7dmr7886662ywe.27.1683471922328; Sun, 07
 May 2023 08:05:22 -0700 (PDT)
MIME-Version: 1.0
From: "Bhav Khurana 4-Year B.Tech. Computer Science and Engineering"
 <bhav.khurana.cse21@iitbhu.ac.in>
Date: Sun, 7 May 2023 20:35:10 +0530
Message-ID: <CAO15ifZ+w4oRRUxcYrJWJrpiFp03v8jBZ9uFwYa3CqrDX0yCtw@mail.gmail.com>
Subject: Regarding Xorg EVoC
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000eb8ec205fb1bd900"
X-Mailman-Approved-At: Tue, 09 May 2023 07:04:45 +0000
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

--000000000000eb8ec205fb1bd900
Content-Type: text/plain; charset="UTF-8"

This is Bhav Khurana, currently studying in the Indian Institute of
Technology (BHU), Varanasi, India.

I am writing this because I had applied for GSoC'23 in the CCExtractor
Organisation. Unfortunately, my proposal didn't get selected because of
tough competition in that project.

I feel that my proposal to CCExtractor was good enough to get selected and
the mentor for that project also admired me for the same. But due to a very
tough competition my proposal stood second best (as told by the mentor) in
that project and hence didn't get accepted.

I came to know of X.org EVoC.

Can anyone please guide me on how should I proceed? I really want to do
something this summer and don't want my efforts to go in vain.

My proposal was based on developing a mobile application using Flutter and
Firebase. I can provide more details and send my proposal for reference.

I will be highly grateful.

Thank you

--000000000000eb8ec205fb1bd900
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto" style=3D"font-size:12.8px">This is Bhav =
Khurana, currently studying in the Indian Institute of Technology (BHU), Va=
ranasi, India.=C2=A0</div><div dir=3D"auto" style=3D"font-size:12.8px"><br>=
</div><div dir=3D"auto" style=3D"font-size:12.8px">I am writing this becaus=
e I had applied for GSoC&#39;23 in the CCExtractor Organisation. Unfortunat=
ely, my proposal didn&#39;t get selected because of tough competition in th=
at project.=C2=A0</div><div dir=3D"auto" style=3D"font-size:12.8px"><br></d=
iv><div dir=3D"auto" style=3D"font-size:12.8px">I feel that my proposal to =
CCExtractor was good enough to get selected and the mentor for that project=
 also admired me for the same. But due to a very tough competition my propo=
sal stood second best (as told by the mentor) in that project and hence did=
n&#39;t get accepted.=C2=A0</div><div dir=3D"auto" style=3D"font-size:12.8p=
x"><br></div><div dir=3D"auto" style=3D"font-size:12.8px">I came to know of=
 X.org EVoC.</div><div dir=3D"auto" style=3D"font-size:12.8px"><br></div><d=
iv dir=3D"auto" style=3D"font-size:12.8px">Can anyone please guide me on ho=
w should I=C2=A0proceed? I really want to do something this summer and don&=
#39;t want my efforts to go in vain.=C2=A0</div><div dir=3D"auto" style=3D"=
font-size:12.8px"><br></div><div dir=3D"auto" style=3D"font-size:12.8px">My=
 proposal was based on developing a mobile application using Flutter and Fi=
rebase. I can provide more details and send my proposal for reference.</div=
><div dir=3D"auto" style=3D"font-size:12.8px"><br></div><div dir=3D"auto" s=
tyle=3D"font-size:12.8px">I will be highly grateful.</div><div dir=3D"auto"=
 style=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8px">Thank=
 you</div></div>

--000000000000eb8ec205fb1bd900--
