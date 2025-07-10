Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09A3B00DBC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 23:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A98610E0E6;
	Thu, 10 Jul 2025 21:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="J1PBSLEA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CD310E0E6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 21:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gHxnev6c8WKquWK4NI89Q11xi1hHesrnV1e9QJqrv9I=; b=J1PBSLEAgeiAZBmCEkqHBT007S
 N1gVXEPFnLGsWB+vmHd+8O+7xqT5ifzhNXj9ZJe219uov/mTiG9Q3l/3O2eoQzhlawva0NqGuXZbn
 cqwhxCPiO763HNgvAK2USjkvBYbwSBgbd2Est7OVXoMJRkE4/9Gv6WoA7cT7kIfK4NxdJRBuxZ/lD
 rCcewf7ppPvIG2NjDIn6SGwKxqk1K+xEcgzS/kr0Scsj4a4g2QmYwLS22AptCVtLXHPZ8berWxN9n
 fGm77pVblt/1TvGV+5SqPxDQKgBDQIObsD5DIYeo7wanAg4gmgbpw+44CdoJWOfeyt5IMp7v+ye+d
 FeMQeYJw==;
Received: from [179.118.186.174] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uZyo1-00F6ld-1n; Thu, 10 Jul 2025 23:27:49 +0200
Message-ID: <08de556b-e63c-420e-8ab4-c03712be9709@igalia.com>
Date: Thu, 10 Jul 2025 18:27:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/doc: Fix title underline for "Task information"
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com,
 simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250704190724.1159416-1-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250704190724.1159416-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Em 04/07/2025 16:07, André Almeida escreveu:
> Fix the following warning:
> 
> Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
> 
> Task information
> --------------- [docutils]
> 

This series is now merged at drm-misc-next, thanks!
