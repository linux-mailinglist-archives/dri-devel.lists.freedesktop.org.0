Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020F0CB7354
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 22:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2590210E2F5;
	Thu, 11 Dec 2025 21:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="ryskBmEF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-106100.protonmail.ch (mail-106100.protonmail.ch
 [79.135.106.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7961E10E2F5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 21:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1765487948; x=1765747148;
 bh=ntvrqEIaXUUNte1JeLsJpcLf4DQFoLnWSgDh/zRtkjQ=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=ryskBmEF/Q4uzCelrqiYiCZ7qThe2nvFMUBws+5IDUwFf+RbRbIjkQRxf5bP7vkjt
 EftaeZk7vs5LRRB1p0wMETk6YRxtOHSlaywIwvrJUfnjJTygCPW5IYpomRwm8dGXcx
 gZ9dKGjhlsOUOcoITsX35dWT9qIAwLvQVPWI5LvWEj2ghTyNVmMkNAj8AAY/rorqt5
 iDG8XfgN6YSn8nDbcR3Go/FCctBEpIppzSp2ku+XRatzuQqyw77srcCIjYQLrzZRJE
 ardeEN7cdyJ0m7wI4thmIV0kt4wM6wTkAbCmAOhxL2ex0PSzUK2ZRe6LoJYiEpbeB+
 4k8uwa8R9KJJA==
Date: Thu, 11 Dec 2025 21:18:57 +0000
To: "xorg-announce@lists.x.org" <xorg-announce@lists.x.org>
From: Simon Ser <contact@emersion.fr>
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [ANNOUNCE] libdrm 2.4.131
Message-ID: <Mso-dPYto56CRBbTF6aUZvdUE-Wu38URZteO_4nd4bfcjvhH1ZtmIVfV0NeZEJh5hcY7IkHXudCRu5HOajjVbtmki5J-qsTUKLWo_p0BNSM=@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 2e446b34339eb0ba1d6d45c48955908c2718f48a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Samuel Pitoiset (1):
      amdgpu: add Steam Machine marketing name

Sergio Costas Rodriguez (1):
      amdgpu: NetBSD lacks secure_getenv

Simon Ser (1):
      build: bump version to 2.4.131

git tag: libdrm-2.4.131

https://dri.freedesktop.org/libdrm/libdrm-2.4.131.tar.xz
SHA256: 45ba9983b51c896406a3d654de81d313b953b76e6391e2797073d543c5f617d5  l=
ibdrm-2.4.131.tar.xz
SHA512: d75894215600b648e25bbe13422901b650fb94bba8276d77971a49db7dc001819c9=
fc4b7e90ed82275f170a331687960ca5752cbb12064b2eec9c5c8eb60bf3c  libdrm-2.4.1=
31.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.131.tar.xz.sig
