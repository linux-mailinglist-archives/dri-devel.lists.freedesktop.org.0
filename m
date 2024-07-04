Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6B6927B2C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 18:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70C310E083;
	Thu,  4 Jul 2024 16:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ux68MPp6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FF810E083
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 16:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VsVGu7SaO/39voxPm+AHRwDd0yVTAjmoCN49SoXRhfA=; b=Ux68MPp6ndC6eIi6JoA4rlHnds
 fO1cOdiz8D7Vz/aSGORepKmpGuuDi1sHMd8QNAkGfrj1KtgTyFqXz3I5FmCXVaxeZlZtjmGcuMG9V
 n3vgfcqSJjLDr8eFz/vJRi8g0dHaKgMPzxAHQMm8aGsLcalDrqHXHk6DdeHPYc02YBhKHDp1A3EHi
 KjEojp7O55JD01/fg3kMFp560wmO3dhn0wAZiXfEPL3b4sXRT4BBWe/fhcPNJauO/37TpnG86CSfD
 AUBkqZLJgNM9cpNHMObJBBI1I06oY9iS/cSVweir3170dgPUdgObierpkpLhfrja9PblRJvaq8FUh
 5mNhMzaQ==;
Received: from [191.19.134.16] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sPPPy-00BAK7-4c; Thu, 04 Jul 2024 18:34:46 +0200
Message-ID: <f59f5b44-0fa7-4229-b060-3a6ffbc2b6c2@igalia.com>
Date: Thu, 4 Jul 2024 13:34:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCE] Graphics & DRM MC at LPC 2024
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Daniel Stone <daniel@fooishbar.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Robert Foss <rfoss@redhat.com>,
 Maxime Ripard <mripard@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>
References: <92bacfe3-efac-4615-9d30-a6215f6bba29@igalia.com>
Content-Language: en-US
In-Reply-To: <92bacfe3-efac-4615-9d30-a6215f6bba29@igalia.com>
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

Em 13/05/2024 13:46, André Almeida escreveu:
> The Graphics and DRM Microconference was accepted for Linux Plumbers 
> 2024! Please, submit your proposal in the following page:
> 
>      https://lpc.events/event/18/abstracts/
> 
> Remember to select "Graphics & DRM MC" in the Track field. The deadline 
> for submissions is Sunday 30th June. The accepted proposals will be 
> listed here:
> 

The deadline was extended till July 15th :)

>      https://lpc.events/event/18/contributions/1664/
> 
> LPC 2024 will happen in Vienna, Austria, on September 18-20:
> 
>      https://lpc.events/event/18/
> 
> Thanks!
