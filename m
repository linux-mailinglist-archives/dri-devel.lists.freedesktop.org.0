Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5550B8A5298
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 16:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A1D1125DE;
	Mon, 15 Apr 2024 14:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bRSc7hqe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907591125CE;
 Mon, 15 Apr 2024 14:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Date:To:
 From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ljnuyj309g/2itlVZDdfjNXk+f84QxRXjXC1RNVY8PM=; b=bRSc7hqeT0ebFpgrrSRZNaA0ed
 n26TriUpOtx6cBBF7bzXraz8VFiuGSKVsp1XgcYwVWQ0a3BOeMr0/eod102P2JrkffzA2BcWeiZdZ
 pQujN2ME4bMFMFbeh+uunhSmtPXnLWFqy0JcWJPltB7qDXryWoUP8AnQWZCaJduGLHT992QFBLOHo
 8xlH8pXfNkDdKxSPhlTaXrn7uzE5TTuY1eSusvZW7p3jsBQLgtPeGp9PWCcf9DGRorXoP0JwRZjzQ
 /d97iImCel8NWXWwL8cpmVztZmwaVQR7+eO3g4wKHyk6hs9780yHc2JaZ44+LX53GYs9N645H0WkN
 fShSpcDQ==;
Received: from 30.red-83-52-1.dynamicip.rima-tde.net ([83.52.1.30]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rwMux-004mu0-Ni; Mon, 15 Apr 2024 16:02:43 +0200
Message-ID: <2309afcf8a6d4e67f589e80a92916e6a73058084.camel@igalia.com>
Subject: 2024 X.Org Foundation Election Results
From: Ricardo Garcia <rgarcia@igalia.com>
To: events@lists.x.org, xorg-devel@lists.x.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org, elections@x.org, members@x.org, xorg
 <xorg@lists.freedesktop.org>
Date: Mon, 15 Apr 2024 16:02:42 +0200
Autocrypt: addr=rgarcia@igalia.com; prefer-encrypt=mutual;
 keydata=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
 p0ZW9AkVq7C3F0YSY0Tq5bKR94O8=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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

The Board of Directors election concluded on 08 April 2024. There were
81 Members of the X.Org Foundation eligible to vote, and 61 Members cast
votes. This is a 75.3% turn out.

In the election of the Directors to the Board of the X.Org Foundation,
the results were that=C2=A0Erik Faye-Lund, Simon Ser, Mark Filion and Neal
Gompa were elected for two-year terms.

The old full board is:

* Emma Anholt
* Mark Filion
* Ricardo Garcia
* Arkadiusz Hiler
* Christopher Michael
* Lyude Paul
* Alyssa Rosenzweig
* Sima Vetter

The new full board is:

* Erik Faye-Lund
* Mark Filion
* Neal Gompa
* Arkadiusz Hiler
* Christopher Michael
* Lyude Paul
* Simon Ser
* Sima Vetter

-Ricardo Garcia, on behalf of the X.Org elections committee
