Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264FA960C45
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 15:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC5910E323;
	Tue, 27 Aug 2024 13:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AE54910E330
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 13:38:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51164DA7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 06:38:39 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D4F0B3F66E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 06:38:12 -0700 (PDT)
Date: Tue, 27 Aug 2024 14:38:04 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Aryabhatta Dey <aryabhattadey35@gmail.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/gpu: Fix typo in
 Documentation/gpu/komeda-kms.rst
Message-ID: <Zs3WvKCbvqCrIO0G@e110455-lin.cambridge.arm.com>
References: <l5wzytcamcc43eadaquqbrfqilq6ajfnnseh37c77eceamtw35@hhtdipi4h22c>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <l5wzytcamcc43eadaquqbrfqilq6ajfnnseh37c77eceamtw35@hhtdipi4h22c>
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

On Tue, Aug 27, 2024 at 06:48:52PM +0530, Aryabhatta Dey wrote:
> Change 'indenpendently' to 'independently'.
> 
> Signed-off-by: Aryabhatta Dey <aryabhattadey35@gmail.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Thanks for the patch!

Jonathan, is that something you can pick up in your tree?

Best regards,
Liviu

> ---
>  Documentation/gpu/komeda-kms.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/komeda-kms.rst b/Documentation/gpu/komeda-kms.rst
> index 633a016563ae..eaea40eb725b 100644
> --- a/Documentation/gpu/komeda-kms.rst
> +++ b/Documentation/gpu/komeda-kms.rst
> @@ -86,7 +86,7 @@ types of working mode:
>  -   Single display mode
>      Two pipelines work together to drive only one display output.
>  
> -    On this mode, pipeline_B doesn't work indenpendently, but outputs its
> +    On this mode, pipeline_B doesn't work independently, but outputs its
>      composition result into pipeline_A, and its pixel timing also derived from
>      pipeline_A.timing_ctrlr. The pipeline_B works just like a "slave" of
>      pipeline_A(master)
> -- 
> 2.46.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
