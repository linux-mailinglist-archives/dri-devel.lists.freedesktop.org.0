Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725423DB48B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 09:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537116F3F2;
	Fri, 30 Jul 2021 07:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5136F3F3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 07:14:58 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id 185so10265268iou.10
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 00:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=alsnJusizE4lyffPNk5/jod0N0MgCUMyAFdHOLB7vOY=;
 b=egIw2Hc5ES0qktzE0ydQP909WoicGtOKMqXkKpjb8N5qKCcm1zjuk79RFznW1cJjcq
 tQRvl4ix8dIVpQ3OyFzZth/0Ft3ziXcKkgWQoS8JNvl0v3rhXRtSUKOKUV1tpI+6M4tf
 IqfQ5GuWSpdHebvfavLEfkrEo3oKljrJrnKr0Yg1Xq2ofbyqIzZ4yA/vaWvX8XjDH6uQ
 ZW/LSXaZXFmUVbl1Gr6EcU3/MLZVNuWrGNSEL2ZltkF+3TJiN/LG7RtMvp2kvp60/uAT
 N7wyVJdZVrRFc0fGpo+D4Tb+XVtSdgPEL+cOvDJq76rl/YI1xlnlqcKoHLcarqM7oHOC
 QBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=alsnJusizE4lyffPNk5/jod0N0MgCUMyAFdHOLB7vOY=;
 b=ZtfrHXfLwxoMaP5229IwkfPaPQFUjg6ggs0CG2V7YZQRJgBdLJfWQePcP/Oy9ZqLTG
 MdsNzCMfV5/oHVduguzf4q6t4VuFYxhgIV0SL3HAGpthxvBLIV+2OBO7WMK2ZaQjtykC
 yK2vHpOZpv2Fk6paG6g027/6JDbW1UwSbCYbKD1+483MAckb1CoSajv3opcx7O2Bz0gO
 5ZzeOk0sM1uOUH4hbDdxZTiGxQKzo2WUKV3wVywmdGbW1TEZomHv0us5rjeIA4cy9ZWg
 Dc187SZsM9mfQE1vK+7n9GxdDbhui0s4LyX2bVP2wyPq5jpZWNhUSWgPG4b5GCcJPKxR
 bkGg==
X-Gm-Message-State: AOAM531i5mNDRsLY1/7s0mXJKVS3Q7/qQQUikHzNsM05jkgMKiVY9fNL
 Nt7JzqtBoZZ0E3t2eF3YFcNSxJTpzvQreVTnYwUNJfmJDcfGWcrS
X-Google-Smtp-Source: ABdhPJwAiTr2vwkEjcV9hSzZRmKBO2jKFH80+Jv4VkckdsmUYGJHrI6uvuEdlHonY/cnwnA5bvwN//dXLUm+Y8NMbJg=
X-Received: by 2002:a02:ccec:: with SMTP id l12mr1011649jaq.61.1627629297365; 
 Fri, 30 Jul 2021 00:14:57 -0700 (PDT)
MIME-Version: 1.0
From: Jimmy Lundstrom <jimmylundstrom7@gmail.com>
Date: Fri, 30 Jul 2021 09:14:43 +0200
Message-ID: <CAB1gG5jgCfB4+=vncYkBR3H3voPgcibR71-_aY9fdmO6hekTjg@mail.gmail.com>
Subject: Re: [PATCH v5] drm/pl111: Initial drm/kms driver for pl111
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000018763305c851fa46"
X-Mailman-Approved-At: Fri, 30 Jul 2021 07:33:07 +0000
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

--00000000000018763305c851fa46
Content-Type: text/plain; charset="UTF-8"



--00000000000018763305c851fa46
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--00000000000018763305c851fa46--
