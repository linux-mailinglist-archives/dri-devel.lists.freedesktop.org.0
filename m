Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B70ACAE55
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 14:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A0C10E514;
	Mon,  2 Jun 2025 12:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 02A7310E514
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 12:55:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38A6812FC;
 Mon,  2 Jun 2025 05:55:35 -0700 (PDT)
Received: from [10.57.64.248] (unknown [10.57.64.248])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 824CB3F59E;
 Mon,  2 Jun 2025 05:55:49 -0700 (PDT)
Message-ID: <6b6d9e84-0c18-4133-99dc-fe07cf5e563e@arm.com>
Date: Mon, 2 Jun 2025 13:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/panfrost: Add BO labelling to Panfrost
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250520174634.353267-1-adrian.larumbe@collabora.com>
 <20250520174634.353267-2-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250520174634.353267-2-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 20/05/2025 18:43, Adrián Larumbe wrote:
> Functions for labelling UM-exposed an internal BOs are provided. An
> example of the latter would be the Perfcnt sample buffer.
> 
> This commit is done in preparation of a following one that will allow
> UM to set BO labels through a new ioctl().
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

All 5 patches pushed to drm-misc.

Thanks,
Steve

