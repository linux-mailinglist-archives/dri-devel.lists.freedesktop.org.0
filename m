Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B0246EDF3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3538E10E1E1;
	Thu,  9 Dec 2021 16:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE6810E923
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 05:52:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d24so7896620wra.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 21:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JUzwZmVW79PQfIwn4LI60O/qzTJ2A/TwGcmTY9URtCo=;
 b=KtSxBlNxuWrfhm326HzjLd8CxvfDxye407sy21FHPaEo9JQfvWhGiH1QHOIunMmzZn
 AN/mVXAtmnlIVVqFaxyErfHi4mbXv46uIt9fltzjMlXgW2roTjzvC4NeUEDW0g6UIaea
 hjJDt5UXb0/eEiwksiIu+LDTIlCoLZ0tjJoNRUJRQdOhZ22terIWzwur9bFDJqHoOBfh
 JNfDr+Dzvlt0jHVb32LVa4MmwYc475E3Bb2wDNBuD39njjM49apkyLsbYodTfu0KhC0G
 /3TtnhjdujT79OdSHQoAJi9z8ZlFwvwSxd5lPgFR9uCVeiCYTUzkCKMx2prLlROK3HSM
 xzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JUzwZmVW79PQfIwn4LI60O/qzTJ2A/TwGcmTY9URtCo=;
 b=QGG5NOkr2tuPfpcAAAYDc4IaOqiCpcJXVaQ1IqobV/ypOXLejB4zFnBAOYazSa0mtR
 N7ONuDig5Sn0t2f1GS3812CuJenYGQ8h1Zy11bQ9VZjYh/jMG/ce5QT44klsb2yCr+LB
 EUXsvB+IaV/5hH25d0d5ZLKjnVAfSbBdGX5CFx7f/SqiXLgSdQ52qcq7+6uRdIn6vqcz
 LDvr2k2mm3j1j7XWyCiKfe49P2Ggua3QzO+pyBDjLuMqH1KB1Nrc0LC5k/274JgFWKsD
 h5Nf6Y9jFsm9pC8nV/clNjo3bJriQSwDlMmygYAkdXu/hkpW30Eplrj3Plsx7dU2H9zD
 UnjQ==
X-Gm-Message-State: AOAM532CmmZI1CZoN8q0hS3bkr+X4JDJaGw6COQcoFKvtlvqEXKF1xiU
 0hA7XW2EKB9oTnJEcCMrWAzOa4Gugf5eSmTa7xVDq+c/bY2G3w==
X-Google-Smtp-Source: ABdhPJz4I5bEAQekx8ajIWDuPktNAOdSwNoIPraWxk1286240rpG8n1J0is6bhpp+6w5szFI4t+nAYF/uRRS14WFE1c=
X-Received: by 2002:a2e:4a0a:: with SMTP id x10mr4033582lja.322.1639025916967; 
 Wed, 08 Dec 2021 20:58:36 -0800 (PST)
MIME-Version: 1.0
References: <20211207225458.622282-1-labbott@kernel.org>
In-Reply-To: <20211207225458.622282-1-labbott@kernel.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 9 Dec 2021 10:28:25 +0530
Message-ID: <CAO_48GHxfeC0Kq4j62BiJ7Xk_vQP0vXYBvuK6+bCczXOYJnGzw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update e-mail addresses for Laura Abbott
To: labbott@kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Laura,

On Wed, 8 Dec 2021 at 04:25, <labbott@kernel.org> wrote:
>
> From: Laura Abbott <labbott@kernel.org>
>
> Consolodate everything under an @kernel.org address.
>
> Signed-off-by: Laura Abbott <labbott@kernel.org>
> ---
> Sumit, can you take this through your tree?
Thanks for the patch; sure I will!
> ---
>  .mailmap    | 3 +++
>  MAINTAINERS | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/.mailmap b/.mailmap
> index 6277bb27b4bf..e7a5bb0c35ae 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -203,6 +203,9 @@ Koushik <raghavendra.koushik@neterion.com>
>  Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski.k@gmail.com>
>  Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski@samsung.com>
>  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +Laura Abbott <labbott@kernel.org> <lauraa@codeaurora.org>
> +Laura Abbott <labbott@kernel.org> <labbott@redhat.com>
> +Laura Abbott <labobtt@kernel.org> <laura@labbott.name>
>  Leonardo Bras <leobras.c@gmail.com> <leonardo@linux.ibm.com>
>  Leonid I Ananiev <leonid.i.ananiev@intel.com>
>  Leon Romanovsky <leon@kernel.org> <leon@leon.nu>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 43007f2d29e0..21ab7c9d1bee 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5715,7 +5715,7 @@ DMA-BUF HEAPS FRAMEWORK
>  M:     Sumit Semwal <sumit.semwal@linaro.org>
>  R:     Benjamin Gaignard <benjamin.gaignard@linaro.org>
>  R:     Liam Mark <lmark@codeaurora.org>
> -R:     Laura Abbott <labbott@redhat.com>
> +R:     Laura Abbott <labbott@kernel.org>
>  R:     Brian Starkey <Brian.Starkey@arm.com>
>  R:     John Stultz <john.stultz@linaro.org>
>  L:     linux-media@vger.kernel.org
> --
> 2.33.1
>

Best,
Sumit.

--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
