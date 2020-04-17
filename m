Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECC91ADC93
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 13:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19436EBA5;
	Fri, 17 Apr 2020 11:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E5A6EBA5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 11:56:07 +0000 (UTC)
Received: from localhost (unknown [223.235.195.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FB722078E;
 Fri, 17 Apr 2020 11:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587124566;
 bh=YuE3Ip9k8tEgEerJuZa5XVgrgjhme/xQBUVEpvc0pEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pnpOPVBdQcqTXLGxlZCLH3MbjROORZwPIvhJGNOVYJO1Bq1fdweZ4Tzj262yzPTHr
 I7zopQnTuiYTCa08aZQp0jGiX3jNauRKVzXXPyUGGswbXRaXICoWVVYU28Uj9O09X9
 MaG2vLlDwtoYhIDwtbmtvOJveCIM6jN5WnC7U+Vw=
Date: Fri, 17 Apr 2020 17:26:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH trivial 2/6] dma: Fix misspelling of "Analog Devices"
Message-ID: <20200417115602.GO72691@vkoul-mobl>
References: <20200416103058.15269-1-geert+renesas@glider.be>
 <20200416103058.15269-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416103058.15269-3-geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Jiri Kosina <trivial@kernel.org>, Stefan Popa <stefan.popa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, linux-iio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dmaengine@vger.kernel.org,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16-04-20, 12:30, Geert Uytterhoeven wrote:
> According to https://www.analog.com/, the company name is spelled
> "Analog Devices".

Applied after updating the subsystem name, thanks

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
