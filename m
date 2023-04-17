Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B1F6E3FF3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 08:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F8810E34C;
	Mon, 17 Apr 2023 06:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 469 seconds by postgrey-1.36 at gabe;
 Mon, 17 Apr 2023 06:40:02 UTC
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D1A10E34C;
 Mon, 17 Apr 2023 06:40:02 +0000 (UTC)
Received: from [10.172.193.56] (1.general.tjaalton.uk.vpn [10.172.193.56])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 429B741FDC; 
 Mon, 17 Apr 2023 06:32:11 +0000 (UTC)
Message-ID: <22235ebd-434f-ec17-43ca-41a29589b202@ubuntu.com>
Date: Mon, 17 Apr 2023 09:32:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [Intel-gfx] [PATCH 0/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Content-Language: en-US
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
References: <20230417062503.1884465-1-fei.yang@intel.com>
From: Timo Aaltonen <tjaalton@ubuntu.com>
In-Reply-To: <20230417062503.1884465-1-fei.yang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fei.yang@intel.com kirjoitti 17.4.2023 klo 9.24:
> From: Fei Yang <fei.yang@intel.com>
> 
> The series includes patches needed to enable MTL.
> Also add new extension for GEM_CREATE uAPI to let
> user space set cache policy for buffer objects.

if I'm counting right, this would be version 5 of the series, yet that 
is not shown anywhere nor the changes between series..

-- 
t

