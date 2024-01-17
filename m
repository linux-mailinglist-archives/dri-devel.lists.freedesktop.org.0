Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D66E8302AA
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 10:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68F010E663;
	Wed, 17 Jan 2024 09:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F00210E663;
 Wed, 17 Jan 2024 09:47:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1DACF6159F;
 Wed, 17 Jan 2024 09:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9E9C43390;
 Wed, 17 Jan 2024 09:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705484828;
 bh=LfGrIBdmJEyFBJfUHMkX0XbzklHWItPHNXU+cjhqFuA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=I+Qu7xQcYgGFuHTN1QnJ5b620qg7pp6ihl+SzPv9q9tlDf5BZJg6s492/yolgJqAR
 g6IauKkZ8iwl+BPQyuQHQdxE6zrtBnBUCNCrrYripHDx+Mp04ET+Q4oFTV7YXRdEn3
 /4e5VLv38XFg/d6nFg7lBKh7Fnllc9ud4BqhdfaBxWp0gbCTMNj55n0l3gV8fsdNpI
 WLGC2Rdq6F2NmblWWcCe5kNcQrPd01FGRHBq5LqPlsY9y4V+UPr7W6XsGNhHU4b266
 MM1/iSB5w+kuxhKtPJDgsh+4IpXW/t1GW4ClGQGIP+hnxblbIwvY1dfoRIcsr+qW9d
 JiBLws4orxovA==
From: Maxime Ripard <mripard@kernel.org>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
In-Reply-To: <20240115171351.504264-4-michal.winiarski@intel.com>
References: <20240115171351.504264-1-michal.winiarski@intel.com>
 <20240115171351.504264-4-michal.winiarski@intel.com>
Subject: Re: (subset) [PATCH v5 3/5] drm/tests: managed: Add comments about
 test intent
Message-Id: <170548482640.96553.2643651506083718393.b4-ty@kernel.org>
Date: Wed, 17 Jan 2024 10:47:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Jan 2024 18:13:49 +0100, Michał Winiarski wrote:
> Add comments explaining the intention behind the test and certain
> implementation details related to device lifetime.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

