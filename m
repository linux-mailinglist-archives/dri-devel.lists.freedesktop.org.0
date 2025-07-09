Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 699A6AFDF6C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 07:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C898510E6FA;
	Wed,  9 Jul 2025 05:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="keR0H+5c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3CD10E6FA
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 05:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=cIKsTqjXQuhd2J8ioLfsqPXzRMlWcw2M/HilT51p21s=; b=keR0H+5csSZTNATbEVkmBGfIYZ
 ebR0H6JAWRvsTmJjPEqJ1WCoYR+31v/Yjv3h0dkqTJNG69Hw7ZRP2gmicM5SyegrceWsQRgM5OCnU
 FZshn2n2Jiw93Dn5Gmwi9026erIUHMBN0IRK5Ee/hkW6jS8GmW1xZtL3Zj2zWx76YMGMzDDdst3QO
 grIts8NaLfCa5r0N03S4aJEbVEh8SqdEQ5wD0vCgWOwUrCGnxRMlrf6ux6Z1hTM41hi2epuTNMvLS
 dBUiApnxJJDmC01D2qefm/c4A5VUemnIVNvudpPQfO20cpED4IGcVNYxstSkekPCcSczAc/Aufyqj
 o2jo5KGg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uZNbj-00000002eto-1aJe; Wed, 09 Jul 2025 05:44:39 +0000
Message-ID: <1d383c61-6493-44a9-ab74-3459e7d37f06@infradead.org>
Date: Tue, 8 Jul 2025 22:44:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/doc: Fix grammar for "Task information"
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com,
 simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250704190724.1159416-1-andrealmeid@igalia.com>
 <20250704190724.1159416-3-andrealmeid@igalia.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250704190724.1159416-3-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
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



On 7/4/25 12:07 PM, André Almeida wrote:
> Remove the repetitive wording at the end of "Task information" section.
> 
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
