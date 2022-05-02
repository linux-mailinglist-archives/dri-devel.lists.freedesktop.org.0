Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CB8517101
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 15:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DC210EF6B;
	Mon,  2 May 2022 13:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D5110E9B0
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 07:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4CDRxG5zC4xFyPZ9EBvZ6XhTrihJFVK9hh144ELS3eo=; b=GfPH8+NE8vmYgj3znUDYQKx+/S
 IEmkGMGdGvvXJmGoANkb808Vhwkf5JBZqn27/vTQLlyPxqfiEJ3RujKltkA91gFhKL1PMZtkXeiWn
 ggftc/axyV/MmDKfGsUNSrUQXmJpDK4SoRM+a0eg47Pl69fZCpSW9KZnaBXbKb0P3rY5/3VoxiOMK
 DR+6ReLLv7ejKjynMk7V3XKKarm73astPcekWh0lJMO32ldnj8H+ncOYqJ/GkSd5R2uGCEI7zfQLb
 dDuxgWg4LvkHYqsIHnh/fib8HeR/XaDKHhrtafFxyzuPLLaV7gVEdvR+vta41cO107itp1Q3eHI3i
 PUEByoIQ==;
Received: from ip171.dynamic.igalia.com ([192.168.10.171])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nlQvj-0007iX-3F; Mon, 02 May 2022 09:57:15 +0200
Message-ID: <fafea4f510b98e7b029277a261e7652ee0a1cc6e.camel@igalia.com>
Subject: Re: [PATCH] MAINTAINERS: add Melissa to V3D maintainers
From: "Juan A." =?ISO-8859-1?Q?Su=E1rez?= <jasuarez@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Emma Anholt <emma@anholt.net>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 02 May 2022 09:57:14 +0200
In-Reply-To: <20220429193317.ol3u4e5jpt5jucox@mail.igalia.com>
References: <20220429193317.ol3u4e5jpt5jucox@mail.igalia.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 02 May 2022 13:52:17 +0000
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
Cc: jmcasanova@igalia.com, itoral@igalia.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-04-29 at 18:33 -0100, Melissa Wen wrote:
> I've been contributing to v3d through improvements, reviews, testing,
> debugging, etc. So, I'm adding myself as a co-maintainer of the V3D
> driver.
> 



Acked-by: Juan A. Suarez <jasuarez@igalia.com>

