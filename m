Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327D0AD41E5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 20:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8553210E30F;
	Tue, 10 Jun 2025 18:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="NobyGtlx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051D410E30F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 18:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1749579981; x=1750184781; i=deller@gmx.de;
 bh=eg47NPwaYF1dlb+AZl9c6lJ72IPynPAJ3GcmEiz5VcE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=NobyGtlx+Pqb6R3uazaeBiXXOrx62cgLgoxustRrO8YkSCKg+5asb8+bfTS1a2Z2
 JU57228f/3JPIHsmG/9I+12dm3D4uBoAdJyjkqie3lr34jHKk6FFKQxVsvqcb+uza
 Q06bjGLprwJ+AjsEi85wVCCnilwjMXgEiVYq1iM0tAVQLbQ4jrvNu9rfLg1l6fO1i
 WjatN+GVbrZ+ju2zJdCdAyiaFeQJlrdizAOyycRgyGlQF1JwJn2HlVr8ZzBMQVgZn
 apT4FOairEL0Jizemy+Y3qCfuY9UDaWA7p6Omw2Vm8S8TourO/ktPcZ/4V+fE89XE
 XPR9THaoxZx54/kvCQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAfUo-1uVcBw2sQK-009hOF; Tue, 10
 Jun 2025 20:26:20 +0200
Message-ID: <2b0dc9a4-adcb-4118-b7b4-d4f154b4cdf3@gmx.de>
Date: Tue, 10 Jun 2025 22:11:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/14] fbdev/matroxfb: Remove trailing whitespaces
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250610105948.384540-1-tzimmermann@suse.de>
 <20250610105948.384540-6-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250610105948.384540-6-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:klQHWbydHBJ8FY0OLwbQlxOm6oThLyqpj5VrH5DWT5wfZoyLikm
 E+Lcb9FFkpcV5Tf6/1X+4WKf4cTOJHJHnv1K5ZJOUy+Dsy3q3q5MFe/5t1ceuPXCP4A7A8p
 MX8TLZFdzRCC4W2pqe+D1MysX4HZqF65kg+DcimIb1b4f1okoaNz/KA4IGiijMVGXAvtWe5
 dPCHYIBNJwAxn2ov+lvgw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:x1LYl6ZM6xI=;6OK8G0tbQ4ecZh+nBHir4SQv08i
 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
 A1YoGrS6LY2sfrBNcDJAY7i8v
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

On 6/10/25 12:56, Thomas Zimmermann wrote:
> Fix coding style.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/matrox/g450_pll.c         | 24 ++++----
>   drivers/video/fbdev/matrox/matroxfb_DAC1064.c | 46 +++++++-------
>   drivers/video/fbdev/matrox/matroxfb_g450.c    | 60 +++++++++----------
>   drivers/video/fbdev/matrox/matroxfb_misc.c    | 20 +++----
>   4 files changed, 75 insertions(+), 75 deletions(-)

Reviewed-by: Helge Deller <deller@gmx.de>
