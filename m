Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A429D7D5FA0
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 03:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E867510E531;
	Wed, 25 Oct 2023 01:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C3010E531
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 01:57:52 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-408425c7c10so42321045e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 18:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=students-everettcc-edu.20230601.gappssmtp.com; s=20230601; t=1698199070;
 x=1698803870; darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vWJ+INQf4tCxlg+gxuIFpJ/9N0DI8JVYTfgoK3zoW4E=;
 b=2AuEwa+MThggZRvarHkUMEsUKJJDW2HBqfWz6CtK157jKRMv/CPgaFPFl8yDoiiM7O
 L0SMTWYazAa5jT1DaTjvTS2VasyLazUjV6PRkX92GKjXaa42XI+1n6SBjTYiHUnzUCM2
 i+pl1x7m293HKOOErhpqPlUkkEHwS0h8/uoJrFi6NXArKAQMTEJyLEDdHCZFafx7vQEp
 L6zSp3/YGGYadS9rOUL35t3OxoxaXczoVEpFIIdsFv3FSH+xErRudQL7tptWRAxK2ru3
 GaRfP11sZzzFE+NyRjPRVU14mHxyp5G9OoxBFG/jysSf0tvuHf5WKmtdr4Mvj4f3KhTP
 jFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698199070; x=1698803870;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vWJ+INQf4tCxlg+gxuIFpJ/9N0DI8JVYTfgoK3zoW4E=;
 b=ghzrq3ZHHZFtuXlsC2qOiqQJl+tQKJuKw4e6JSlVdLNiO6a6MvOMDKPCxHgwXS7D/B
 uPr+A+WE48gS/BOutOfcuNFzmGrJ8pylJoDLSGZ7ZNDd2aXiE/yOfJqDNLb6yHM/XDuh
 KGupxeKgf76+tYPALKv++EeWFxafQPIIKUszV+RNTtJ/76xRr/hl/ELUKVBUhOlu7OYh
 ilJr/aQBihnxDRpG1HY45zJZY0Giz0Z4pwwGC8x/wCcxHtVVNKJukxRyVNri036ZPAg/
 LAylYgGFAQM168Q1RcXAb1KWL+8LITFHm484VzrGduO5CksKSCxIzCw1LPigelvbIY8D
 4LfQ==
X-Gm-Message-State: AOJu0YyB2TG4vMAeDy+kjbMEM1Ff+29lZ5zplTSq02qNVFKJNlCV6FJk
 oM/fufy99ZXFd3IvbeisS5el3HzkZObG/ajYE0ecYli57j9t8atFnrI=
X-Google-Smtp-Source: AGHT+IEY1r16jcQ0ZaJM6vMz0RMcqfWFVaturnlf2UQ/VFrKZ5wzKH/Hba2DSmvlCUe6KVf5/5ztLe0jQlcm6n5zJ5A=
X-Received: by 2002:adf:e644:0:b0:32d:9755:374b with SMTP id
 b4-20020adfe644000000b0032d9755374bmr10639907wrn.30.1698199070405; Tue, 24
 Oct 2023 18:57:50 -0700 (PDT)
MIME-Version: 1.0
From: DAVID WALTERS <dpwalters@students.everettcc.edu>
Date: Tue, 24 Oct 2023 18:57:36 -0700
Message-ID: <CAFDyzQrcO-ra8z6_jijE5uvSUcH-OM2KhENZH7tu4t1msAnZKA@mail.gmail.com>
Subject: Evoc proposal
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000599337060880c833"
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

--000000000000599337060880c833
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
  I have a draft of a proposal that I would like feedback on from Ma=C3=ADr=
a
Canal (or another mentor). If you could please let me know their email
address (or I could send you the draft and you could forward it to them).
It's for the KUnit and DRM project.

Thanks,
  David Walters.

--000000000000599337060880c833
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br>=C2=A0 I have a draft of a proposal that I would=
 like feedback on from Ma=C3=ADra<br>Canal (or another mentor). If you coul=
d please let me know their email address (or I could send you the draft and=
 you could forward it to them). It&#39;s for the KUnit and DRM project.<br>=
<br>Thanks,<br>=C2=A0 David Walters.<br><table align=3D"left" cellpadding=
=3D"1" cellspacing=3D"5" border=3D"0">
              <tbody><tr><td align=3D"left"><br></td></tr></tbody></table><=
/div>

--000000000000599337060880c833--
