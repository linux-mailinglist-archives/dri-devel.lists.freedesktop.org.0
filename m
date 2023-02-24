Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6816A2044
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 18:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145DD10EC77;
	Fri, 24 Feb 2023 17:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5D810EC77
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 17:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677258429; x=1708794429;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Obaq5kMiLUeRIhWvu6pLPyEKuLtFz1TZGZ7YGBRYKcw=;
 b=OiE06yliN1nfjGJA7BJpCFRJ7B2CHuoDPNpGPyM/iOQflq1rmBm/gM+d
 /KTR4DIe9KG4P8tOFL3PkgVn//gos6NSkLM/dffS08EPj0ATO3RDsRorj
 3HYnhd3F/PVK4UolA6qNHkVZHsw7+u/o/KpYBiQvkq5bCay09EW+7YJt7
 ftv2Fz4DlzT2KenEIGhUKTrOJ3iWNXGiljSBJffsxIYfKN6oigfYhwJ//
 wK2rg0og9eoHCRmIurJGGlvTsykJtT4zPb89XHCuPhQo6+PKjUWE7QvQE
 /c1ya6G7zLLp33uB1dHglbUAgRfVSrNXeo53cyipwTc8aIx2mfAQZGlTO g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="332214398"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="332214398"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 09:05:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="761835990"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="761835990"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 09:05:25 -0800
Date: Fri, 24 Feb 2023 18:05:23 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 1/4] habanalabs: organize hl_device structure comment
Message-ID: <20230224170523.GD3547587@linux.intel.com>
References: <20230220091939.3467487-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220091939.3467487-1-ogabbay@kernel.org>
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
Cc: Sagiv Ozeri <sozeri@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 20, 2023 at 11:19:36AM +0200, Oded Gabbay wrote:
> From: Sagiv Ozeri <sozeri@habana.ai>
> 
> Make the comments align with the order of the fields in the structure
> 
> Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com> for the whole series.

