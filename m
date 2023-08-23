Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B2378672F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 07:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2069210E056;
	Thu, 24 Aug 2023 05:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057EE10E08F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 17:23:10 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-58d31f142eeso62473207b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 10:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692811390; x=1693416190;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mMv6YzSuj5WAmAMNB+Vpyx1JxVP0A1C/O4/NeOcCwtE=;
 b=i6OJ/NjDnY2DejRze37fbDaMXvEQn9qptiyMFRKL+OicLT/KwbEMAegSTvk0ZJ01OK
 GUi8Itsyhxd1bIzH6U7sz2EF/JcAQ7dsA0lbGXTEecSe2HltaHoTF+OPOkuYScgccXt6
 UuxtqevM/tjv6vq4Yy7324jlLikhvoEAyr2j3L2VBkzhz/wlzVTbCi7bw+iqbiGRL9tE
 4mam36BZCDbuCI5hMjbyqJ0xmbtDerN+ihTPtQSrTt8CnAJsSqo1y8/xvgODucGtkjQA
 6UoYBqozNNkYvKJghqQTtHpQ3t/QQzQMzsqXVxauhZ5Xg/XvvFm9tB/jtHkE/qW4Z7Ua
 rD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692811390; x=1693416190;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mMv6YzSuj5WAmAMNB+Vpyx1JxVP0A1C/O4/NeOcCwtE=;
 b=I/TR/rbZHh4EdGGdfFXJVP0VJZ2jeZ50Yt99tnvgCygtyHYsRaLgT17I1ePZBUF0Zp
 q1Xu9w0G1DZWWPFzWYyx4w8A0CVbkKRCtqB7ssvnPf+VkVj9ntkrOVwSH74MlGW1SCA5
 4UpxcO92ENJa0oUtVnt+ya2PxM4xQDcINfRrsqg/KWwu2tMUtXFsE10x213ozdoi+9Kn
 XMQzaN5+YBPYq1IefVRPulpeo8dzpDBD/hwIisKFxxTgoQuvbkhzYLy/Rp0rV8M+OHXn
 8IP/r/XsDYlBhfJRr861Qj8m3NLUTFVnFPWzNOCrvCUCkYtV88t7FBHXTzP9utRmqTn9
 eiWw==
X-Gm-Message-State: AOJu0YylES3XALfryxzl+YedRJjohi9fxjV7bpKwIH3SoZX9TdHvW978
 kzxmlSMFV3gV9BHX10pyhi/OOukDiVFsdiwFKwmVndjhY+M=
X-Google-Smtp-Source: AGHT+IGetvQQmaDHzTn66LnWc+i1CTg3gyW16tHINqhY3oiV3svAZ1GPqEdpr+D90D9tmWZjw82C3EiNYtefsAKJYaU=
X-Received: by 2002:a0d:e606:0:b0:579:e8de:3580 with SMTP id
 p6-20020a0de606000000b00579e8de3580mr14770053ywe.9.1692811389844; Wed, 23 Aug
 2023 10:23:09 -0700 (PDT)
MIME-Version: 1.0
From: Raghav Sharma <raghav.k.sharma99@gmail.com>
Date: Wed, 23 Aug 2023 22:52:58 +0530
Message-ID: <CAJUeM5mZGtcUi92hgjG-5hDfw2Th-1ZUyP9M7Y0qxwBArJ3qOQ@mail.gmail.com>
Subject: Hardware Requirements to participate in the EVoc
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000009043bb06039a5d0b"
X-Mailman-Approved-At: Thu, 24 Aug 2023 05:31:50 +0000
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

--0000000000009043bb06039a5d0b
Content-Type: text/plain; charset="UTF-8"

Hello

I am a student from India pursuing a bachelor's degree in engineering . I
would love to be a part of the EVoC.

I would like to know whether the hardware requirements are a bar to entry
to the program?
Can somebody who does not have prescribed hardware participate?

Thank You
Raghav Sharma

--0000000000009043bb06039a5d0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello</div><div><br></div>I am a student from India p=
ursuing a bachelor&#39;s=C2=A0degree in engineering . I would love to be a =
part of the EVoC.<div><br></div><div>I would like to know whether the hardw=
are requirements are a bar to entry to the program?</div><div>Can somebody =
who does not have prescribed hardware participate?</div><div><br></div><div=
>Thank You</div><div>Raghav Sharma</div></div>

--0000000000009043bb06039a5d0b--
