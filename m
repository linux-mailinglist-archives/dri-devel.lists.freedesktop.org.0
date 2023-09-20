Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B21C37A79FE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 13:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB0410E482;
	Wed, 20 Sep 2023 11:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6097B10E481
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 11:05:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D5CA8CE1997;
 Wed, 20 Sep 2023 11:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4234C433C8;
 Wed, 20 Sep 2023 11:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695207950;
 bh=HPnHcdGsXx+1/F/vWLQwG3CgHfbFgIeKZKX9aDYdnIE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hLhNUNe41JJqhRuAzZiIUYASqPrfAl/ZMOhyFmxnOjEZJupyF75Ieokn39tAor05I
 bWUF/DbKTF2za+iGkXA48qb5MGOQ+rscrXw7Ps1kt32FRxPER/C64RC11u4juRXzf0
 fnbadh25PFHBK+p87vHT1ZQshA/SREnACUoPvhSmiRFcVGaXIqiySgiWX2mv+I8Qvx
 eI2J8NKFKHjHxkGWfqFMdGbFI1nc1vSucTyqFYQSS/Nc3t5xS0+q8uHxxGjbdcxP61
 rsVlALLCz5FWToR5rKsWQ7ACqvmwPX9512SeTDRZ+/eq9mO4woOHeV713UGmf/d5S6
 7Pnzj7bzDgDAw==
From: Robert Foss <rfoss@kernel.org>
To: devicetree@vger.kernel.org, Alicja Michalska <alka@sakamoto.pl>
In-Reply-To: <ZQjFabKW7QvrvsnG@tora>
References: <ZQjFabKW7QvrvsnG@tora>
Subject: Re: [PATCH] dt-bindings: display: anx7814: Add definition for anx7816
Message-Id: <169520794731.2886650.6229973155734837389.b4-ty@kernel.org>
Date: Wed, 20 Sep 2023 13:05:47 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: neil.armstrong@linaro.org, jernej.skrabec@gmail.com,
 andrzej.hajda@intel.com, jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Sep 2023 23:49:44 +0200, Alicja Michalska wrote:
> As requested by Robert Foss <rfoss@kernel.org>, this patch adds
> definition for anx7816. It supplements the patch submitted to dri-devel.
> 
> 

Applied, thanks!

[1/1] dt-bindings: display: anx7814: Add definition for anx7816
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5305d85077c7



Rob

