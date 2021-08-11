Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 361633E9B42
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 01:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3476E1F5;
	Wed, 11 Aug 2021 23:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702C76E200
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 23:32:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="278986385"
X-IronPort-AV: E=Sophos;i="5.84,314,1620716400"; d="scan'208";a="278986385"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 16:32:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,314,1620716400"; d="scan'208";a="673243170"
Received: from jhwillia-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.11.58])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 16:32:09 -0700
Date: Wed, 11 Aug 2021 16:32:02 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, airlied@redhat.com
Subject: Re: [PATCH] drm/edid: fix edid field name
Message-ID: <20210811233202.6wqtlmum4wjavaat@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210811205818.156100-1-lucas.demarchi@intel.com>
 <fNYfXtEqPuvThfQgTb62cr8mjJl9SOGfXX02gNF9b0FmpcvY5b-c1EiJrtJQio_j64_0t0EVnOpfkLctibSPbmH2q6YtWbc9Ct3BNqrOnuA=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <fNYfXtEqPuvThfQgTb62cr8mjJl9SOGfXX02gNF9b0FmpcvY5b-c1EiJrtJQio_j64_0t0EVnOpfkLctibSPbmH2q6YtWbc9Ct3BNqrOnuA=@emersion.fr>
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

On Wed, Aug 11, 2021 at 09:32:49PM +0000, Simon Ser wrote:
>Reviewed-by: Simon Ser <contact@emersion.fr>
>
>Do you need me to push this?

yes, please. I'm a committer only on drm-intel and I guess this should
go through another tree.

thanks
Lucas De Marchi
