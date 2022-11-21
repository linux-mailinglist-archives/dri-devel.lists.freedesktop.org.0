Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 999486323C3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 14:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90FD10E12D;
	Mon, 21 Nov 2022 13:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CD810E12D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 13:34:01 +0000 (UTC)
Date: Mon, 21 Nov 2022 13:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1669037639; x=1669296839;
 bh=cWyjS8gJ5tYyIQcQGe5x9R0S+IOi2uZyenuqRvdGD6M=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ILoOFbgNvrObh0zLDV1ydlnFPyd2OcpXrNdSngiGAHxaV+qoBo8sIgM8E9mW5GDXv
 qnGU/jPbxH9zlCS091gM2bF+kgb470a6oyPNV2VGWX/24mQhxQV9Jn911N+xY2SjNO
 8jhVZ/CLaBgipbxki3ThWeYI/YJGxDsPjO33YMbXiCJ/vu912kQSdsXfVNbQclOT2T
 sc17JGHYR17xP7ZKI9cddTVIVfQRU5Dz4mxopOlOC1SixIxmy4iErbJC6mJ9vDfG2/
 FCqMbGlk3LwlnA3QZi9dCLLtsBcSsn1BZtVQKbCbzE0jcX4coZxb1mAYlVDrB1w1+j
 hDW/VC+QRfg0g==
To: =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: git send-email friendly smtp provider anyone?
Message-ID: <9-qCHLoI7vMtVX2UmZbrcDSyMIJRqoWx6G2sZEn08RP15vYjPwng_fInDkKYPvllUddwXshfYs_fIpPH3_TeFLat2MQx_LT5Hfb0dxb1vGA=@emersion.fr>
In-Reply-To: <1bc45775-0667-01f8-36e1-9f65d3081092@tronnes.org>
References: <1bc45775-0667-01f8-36e1-9f65d3081092@tronnes.org>
Feedback-ID: 1358184:user:proton
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I think you can apply for a linux.dev mailbox [1].

[1]: https://korg.docs.kernel.org/linuxdev.html
