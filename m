Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD5F984F2C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD6210E917;
	Tue, 24 Sep 2024 23:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FLL/HYX+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F0C10E905
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 23:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vMeg85SAmWjRatEDJOqhz6rV23+6rZWVMuFi4NmG6gM=; b=FLL/HYX+jWFvxaatQpRUrZsYP+
 sMd8s+VLiQB9X8UQc5wWBliXiPlUsGWpt9p+mmrMW8/IwdeuSIlqLZst7chPkIwrtTNoDr+WHbftG
 UDgzlTnuwk1eEU9iomiIbselEQIUBaAjv+z51gvntgd7qj2PZn4xuF/rhSqUFaMZM0OGljAIYEatW
 8Rh7i38ROtP/oFW7ueTXhApwqzt+rVYYHWWuxYKn3Jm2NtABBT2vM8Jnl8YLouyEO2NPqwSTnccKd
 vLnppGqDqzkbtH065BVzmZI4OyMJ3S/NMx6VdSLQvQt69jPP43ovJqYeIo4wYZRrP0c25/lF1ZHWw
 oz8omSgw==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1stFNf-000euy-PG; Wed, 25 Sep 2024 01:55:44 +0200
Message-ID: <7bef0a63-6634-422f-a2d1-c642b9226845@igalia.com>
Date: Tue, 24 Sep 2024 20:55:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: remove myself as a VKMS maintainer
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240911135051.44579-1-rodrigosiqueiramelo@gmail.com>
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
In-Reply-To: <20240911135051.44579-1-rodrigosiqueiramelo@gmail.com>
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

Hi Siqueira,

On 9/11/24 10:50, Rodrigo Siqueira wrote:
> I haven't been able to follow or review the work on the driver for a
> long time and I don't see the situation improving anytime soon. Hence,
> this commit removes me from the maintainers list.
> 
> Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

Applied to misc/kernel.git (drm-misc-next).

Best Regards,
- Maíra

> ---
>   MAINTAINERS | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 333ed0718175..1e6356a1b6c7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7346,7 +7346,6 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	drivers/gpu/drm/udl/
>   
>   DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
> -M:	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
>   M:	Maíra Canal <mairacanal@riseup.net>
>   R:	Haneen Mohammed <hamohammed.sa@gmail.com>
>   R:	Simona Vetter <simona@ffwll.ch>
