Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7EB6C1050
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 12:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DA910E3B3;
	Mon, 20 Mar 2023 11:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC9510E3B3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 11:10:10 +0000 (UTC)
Date: Mon, 20 Mar 2023 11:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1679310608; x=1679569808;
 bh=dJZln88lN2ZOtbXwmt+yMlSaTT1Nk8VC901yTzLI2ig=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=h/4qo/V8KsRx1BwwYxr3xodV6q+lYad3q+r0EcS/2CoA8PV9x+NVV7I0jH1P/QAB8
 ELC93I7D0Uk7mw8GsGiJX3zwqnvKF7oYVJHz10YIQPAaE+S/mCF+GrhqMFTynfGZrs
 8x3HoihoypOg47284V0pw4AAFx1mKL+j2qBFfsK1MSoNBU4Zw77Rbx0uS8MEwz0qPP
 p+j6woXdglZ/rERdXVXHPpiAmKhgHpt8hkF/gVUanEMvVl4QTDwgMluArU3iZrzLSD
 i1A4lLWx6H9/Md+9k3svYD20k298UYZgz7u5VV4XdRbTNm9Qydo8aXtUDi8GoLD5v2
 nNlbkw8ZyX6vw==
To: Petr Tesarik <petrtesarik@huaweicloud.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/prime: Fix documentation of
 drm_gem_prime_fd_to_handle()
Message-ID: <Df--jGGCv5NJg1pmpWj1t2W6ndLBt56vWwEpi81s22ddGn39zPZOq1pdEaRud5P8PqiRexkHjTiByoOi0IEl_7pTQsrNFWLOmlWYGRUzWds=@emersion.fr>
In-Reply-To: <20c0416b-90f7-7fa3-5f32-a44400817f4d@huaweicloud.com>
References: <20230224120931.1024-1-petrtesarik@huaweicloud.com>
 <GLe6vWnaxm8W1VD0ltNz62HDAhn5b1rgraCJchuToDl-vb5m9gsGl2ml2xeTQfRwlWlTQXvqOUzYiSgz1GmOk76Jag5VR7Pzwm0iM-86igQ=@emersion.fr>
 <20c0416b-90f7-7fa3-5f32-a44400817f4d@huaweicloud.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, petr@tesarici.cz,
 roberto.sassu@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed to drm-misc-next, thanks!
