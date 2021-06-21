Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE633AF509
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 20:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7167D6E34B;
	Mon, 21 Jun 2021 18:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5761D6E170
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 14:10:57 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 j21-20020a05600c1c15b02901dde2accccbso67160wms.4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 07:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=hpOjQMpzahmEPFFLXJq2l2uqwXtIIxRNY1rOeJS2/Ho=;
 b=r5QoTuUXlY2IEVB6e/OXedda1lTLlQquorQ3rncbOm+P4Q7tTs2aLXOHv6b3HD9Vh/
 3Py+3JQ0O+1bPwdhgKUUVj0pzVRydHaLvWgk2F1eXrJFcWzh9fnAGKu8jW2I/l5WOC3g
 SpO/1yFY3u+85Vz5hHk8nUbF57a/Mtr9JqoeYj7HwfijeTuxm4hMpNzyCWOyMw/ynvuC
 c5QhusLWgxNWkiJlSPFGQ6S3vK02ieZ/8yiR44COSq+frZBvXgX/wAYFfjvOuI+8z081
 lGs2omA++OjSsQaYWkB0zppETptaCTMEPx4ryfVIfomk++62o3GQun1RU1YomYGpF1Zq
 EdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hpOjQMpzahmEPFFLXJq2l2uqwXtIIxRNY1rOeJS2/Ho=;
 b=E4Qia/uPp75V1DW1MgdGF8/LZ5oQ1h73BPYQtWtR19ocGk1ssAlLO3L+iOhTZ6UNWQ
 LsXjYiyqjnAHtAad4lXFvtJe2y1cTqsDkDhxzYCH5l4FbIO9rLZnmJppR9hiErAmgWfM
 wPcAIkW7oT2bKhR6xJMxbJbI6oDcKVAutK4h3TYvdYVsPRFbpt9pqorrd8jD9U8FlvBL
 Vs0yL+EonAv8ddLyyustYVsSKOBVerI4KxFN8DfjUl+E1YWeVmRRudXutMYdXqCdR+OJ
 Jrv5rVreJtHzOK9brutkeM1TH3BySL+M/PXI6NXv8RmhdP2mvrA7MEJp8Y6o8Rr4ZzUA
 5Qog==
X-Gm-Message-State: AOAM531yZ/6iquS8SNkqFF7feYq/U0IBUBHnInRkVzOIz9JoRidSGfrA
 hnWduaX3ksT2S2NvzqPAYRpAwje1GED/Iv8UQqH2U87quCoSRg==
X-Google-Smtp-Source: ABdhPJzTQXZQHjnz6tT3yBctg5iyv12WDB9/O4RPASIYVx/2rX/4Q0cjfNg0/o4EQXzszghLlBcdhNAqdRRd3wogrJk=
X-Received: by 2002:a05:600c:3b1e:: with SMTP id
 m30mr2867762wms.25.1624284655716; 
 Mon, 21 Jun 2021 07:10:55 -0700 (PDT)
MIME-Version: 1.0
From: shashank singh <shashanksingh819@gmail.com>
Date: Mon, 21 Jun 2021 19:40:44 +0530
Message-ID: <CAGsV3ysM+p_HAq+LgOe4db09e+zRtvELHUQzCjF8FVE2UF+3Ow@mail.gmail.com>
Subject: 
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000eb0c1c05c5473d6e"
X-Mailman-Approved-At: Mon, 21 Jun 2021 18:26:05 +0000
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

--000000000000eb0c1c05c5473d6e
Content-Type: text/plain; charset="UTF-8"

Hello everyone, my name is Shashank Singh. I hope this is the right
platform to reach out to the 'X.org' community. I was curious about the
X.org Endless Vacation of Code. Is this program still active?

--000000000000eb0c1c05c5473d6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello everyone,=C2=A0my name is Shashank Singh. I hope thi=
s is the right platform to reach out to the &#39;X.org&#39; community. I wa=
s curious about the X.org Endless Vacation of Code. Is this program still a=
ctive?<h1 id=3D"gmail-thex.orgendlessvacationofcodeevoc" style=3D"color:rgb=
(43,94,130);font-size:25.856px;font-family:&quot;Times New Roman&quot;"><br=
></h1></div>

--000000000000eb0c1c05c5473d6e--
