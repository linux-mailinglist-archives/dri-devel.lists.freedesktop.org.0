Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1AE8CFE2A
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 12:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D3E10E15F;
	Mon, 27 May 2024 10:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cgbbLm2u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8173B10E15F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 10:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5S1TNssBV6cfl4osrjOA3UjpIdLqm7Qpr7+Uv47UKpg=; b=cgbbLm2uGrPfxlSDjIso3PH1Ck
 Ii8LTaFitzd1e304NN8jqrviTMCNhgQCBC+VVbMyqGLQRDKKWybrdZtkyHEhGEyg/qCZfIpp7AO0J
 eLoC44CTASsfBUSxh4W0KFmuqv4fxAWT0cgYysyzTb8LsCpw5QOnrrqVZMaAfdXsf9oiAnh4a6dB2
 3xqPOR8MfK427FfsCiNX3mOoscyoO7zVe4gArlaZqVnnTRggITHSS056GpyFz3KTBTxapcAsY/YJo
 3DEdj6nc9BLM1BUkhg2ifjf+2lgN9WQpiNL5fwIE42AgevKIpQh/LEwa5fIldjas9qX29qEX/X+D6
 X4JLrv+g==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sBXeq-00CwEQ-1d; Mon, 27 May 2024 12:32:48 +0200
Message-ID: <2aa13716-daf9-4d07-a8ef-8b43b11725cd@igalia.com>
Date: Mon, 27 May 2024 07:32:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: remove myself as a VKMS maintainer
To: Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240525142637.82586-1-melissa.srw@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240525142637.82586-1-melissa.srw@gmail.com>
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

On 5/25/24 11:26, Melissa Wen wrote:
> I haven't been able to follow or review the work on the driver for some
> time now and I don't see the situation improving anytime soon. I'd like
> to continue being listed as a reviewer.
> 
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>

Acked-by: Maíra Canal <mcanal@igalia.com>

Thanks for all the good work you put into VKMS in the last couple of
years!

Best Regards,
- Maíra

> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7d735037a383..79fe536355b0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7027,10 +7027,10 @@ F:	drivers/gpu/drm/udl/
>   
>   DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
>   M:	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> -M:	Melissa Wen <melissa.srw@gmail.com>
>   M:	Maíra Canal <mairacanal@riseup.net>
>   R:	Haneen Mohammed <hamohammed.sa@gmail.com>
>   R:	Daniel Vetter <daniel@ffwll.ch>
> +R:	Melissa Wen <melissa.srw@gmail.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
