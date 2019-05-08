Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FDC17F2B
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 19:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FE889740;
	Wed,  8 May 2019 17:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39ED0891EB;
 Wed,  8 May 2019 17:35:23 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFFBF21726;
 Wed,  8 May 2019 17:35:22 +0000 (UTC)
Date: Wed, 8 May 2019 13:35:21 -0400
From: Sasha Levin <sashal@kernel.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH AUTOSEL 4.19 29/53] drm/amdkfd: Add picasso pci id
Message-ID: <20190508173521.GJ1747@sasha-vm>
References: <20190427014051.7522-1-sashal@kernel.org>
 <20190427014051.7522-29-sashal@kernel.org>
 <BN6PR12MB18098B1A85760FCFFFDD3C37F73F0@BN6PR12MB1809.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN6PR12MB18098B1A85760FCFFFDD3C37F73F0@BN6PR12MB1809.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557336923;
 bh=D5oYv12EgZbTo/RBYo4r7MelGMC1ktuMOi58r0P/8fY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tYg8DjS95MbVrrI00lYF1Z51VtMwLc6neeT9JEeB7wNozFoXb2mdBkXrB4Ppl21Ka
 j1J9sVqkIDIlT+eLmy/junnNAcUQDGnnf2KbPUDeaMl5iI2/xfKcXNSVwEGpB2efMI
 9qrWRHSzy1x0nSPo8mnTue+ojf9DjiB1DCUbdLlE=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBBcHIgMjcsIDIwMTkgYXQgMDE6NDk6MjdQTSArMDAwMCwgRGV1Y2hlciwgQWxleGFu
ZGVyIHdyb3RlOgo+TkFDSy4gIDQuMTkgZGlkIG5vdCBjb250YWluIHN1cHBvcnQgZm9yIHBpY2Fz
c28uIFBsZWFzZSBkcm9wIHRoaXMgcGF0Y2ggZm9yIDQuMTkuCgpEcm9wcGVkLCB0aGFuayB5b3Uh
CgotLQpUaGFua3MsClNhc2hhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
