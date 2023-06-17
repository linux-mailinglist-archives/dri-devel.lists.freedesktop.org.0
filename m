Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB7D734575
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 10:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE3210E0F0;
	Sun, 18 Jun 2023 08:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C2F10E062
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 20:08:40 +0000 (UTC)
Date: Sat, 17 Jun 2023 20:08:26 +0000
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="dWL1QV93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1687032512; x=1687291712;
 bh=sPS4dQUxLPUYuZ74lUcsX6ZoaGm98/rHdc7cnG3JD74=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=dWL1QV93JoV1eI5OYnbYw+X57Mkn38DLxFmTfHwrYlRhq2d1G17kSSukM/yRSYWXH
 dR68sGxQTTfR3gt32iOu/JSjdf7vrIQlG6BCHzhA+8xNDk/LQcE9j2m8j3l56MpWg8
 xS1HG/UN6uJAUHigavI8ZnLlrPLVXu/nMqqRXANNrh2Vf9y9bq/Cic66jUYju3dw/8
 w4YUCiDMSt0e4vfaKLS9R1EE2NrJmjDt61lbOO9ZSbT9OgfdzvMirpEs+5vM+Vqbe1
 ETgc1GMA6KO3Pi8zN0bEKMuFkJXAtFRJhix7qa6m8cJjY1uYGwufXFVEEb1ZSOKMi0
 bAHtWouxokRMw==
To: megi@xff.cz
From: Julian Fairfax <juliannfairfax@protonmail.com>
Subject: Re: [PATCH] drm: bridge: dw-mipi-dsi: Fix enable/disable of DSI
 controller
Message-ID: <KLYEWR.P22SWVRU2CZ@protonmail.com>
Feedback-ID: 23985752:user:proton
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_Tc2w1NcqMYTrR5nYe14hf7aL8qjq6QnJdW3afwdmHgg"
X-Mailman-Approved-At: Sun, 18 Jun 2023 08:21:45 +0000
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org, andrzej.hajda@intel.com,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.

--b1_Tc2w1NcqMYTrR5nYe14hf7aL8qjq6QnJdW3afwdmHgg
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

VGVzdGVkLWJ5OiBKdWxpYW4gRmFpcmZheA==

--b1_Tc2w1NcqMYTrR5nYe14hf7aL8qjq6QnJdW3afwdmHgg
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PC9oZWFkPjxib2R5PjxkaXYgaWQ9ImdlYXJ5LWJvZHkiIGRpcj0iYXV0byI+
PGRpdj5UZXN0ZWQtYnk6IEp1bGlhbiBGYWlyZmF4PC9kaXY+PC9kaXY+PC9ib2R5PjwvaHRtbD4=


--b1_Tc2w1NcqMYTrR5nYe14hf7aL8qjq6QnJdW3afwdmHgg--

